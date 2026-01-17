/**
 * Script para importar dados de investimentos do Google Sheets para o Supabase
 * 
 * Uso: npx ts-node scripts/import-from-sheets.ts
 * 
 * Variáveis de ambiente necessárias:
 * - SUPABASE_URL
 * - SUPABASE_SERVICE_KEY
 * - GOOGLE_SHEETS_ID (ID da planilha)
 * - GOOGLE_SERVICE_ACCOUNT_KEY (JSON da service account)
 */

import { createClient } from '@supabase/supabase-js';
import { google } from 'googleapis';

interface Investment {
    ticker: string;
    name: string;
    type: 'ACAO' | 'FII' | 'RENDA_FIXA' | 'ETF';
    sector: string;
    quantity: number;
    avg_price: number;
}

// Inicializa cliente Supabase
const supabase = createClient(
    process.env.SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_KEY!
  );

// Configuração do Google Sheets API
async function getGoogleSheetsClient() {
    const credentials = JSON.parse(process.env.GOOGLE_SERVICE_ACCOUNT_KEY!);

  const auth = new google.auth.GoogleAuth({
        credentials,
        scopes: ['https://www.googleapis.com/auth/spreadsheets.readonly'],
  });

  return google.sheets({ version: 'v4', auth });
}

// Busca dados da planilha
async function fetchSheetData(): Promise<Investment[]> {
    const sheets = await getGoogleSheetsClient();
    const spreadsheetId = process.env.GOOGLE_SHEETS_ID;

  const response = await sheets.spreadsheets.values.get({
        spreadsheetId,
        range: 'FinB3_Import_Investimentos!A2:F100', // Pula o header
  });

  const rows = response.data.values || [];

  return rows.map((row) => ({
        ticker: row[0],
        name: row[1],
        type: row[2] as Investment['type'],
        sector: row[3],
        quantity: parseFloat(row[4]) || 0,
        avg_price: parseFloat(row[5]) || 0,
  }));
}

// Insere ou atualiza dados no Supabase
async function upsertInvestments(investments: Investment[]) {
    console.log(`Importando ${investments.length} investimentos...`);

  for (const investment of investments) {
        const { error } = await supabase
          .from('assets')
          .upsert(
            {
                        ticker: investment.ticker,
                        name: investment.name,
                        type: investment.type,
                        sector: investment.sector,
                        quantity: investment.quantity,
                        avg_price: investment.avg_price,
                        updated_at: new Date().toISOString(),
            },
            { onConflict: 'ticker' }
                  );

      if (error) {
              console.error(`Erro ao importar ${investment.ticker}:`, error);
      } else {
              console.log(`✓ ${investment.ticker} importado com sucesso`);
      }
  }
}

// Função principal
async function main() {
    try {
          console.log('Iniciando importação do Google Sheets...');

      const investments = await fetchSheetData();
          console.log(`Encontrados ${investments.length} registros na planilha`);

      await upsertInvestments(investments);

      console.log('Importação concluída!');
    } catch (error) {
          console.error('Erro durante a importação:', error);
          process.exit(1);
    }
}

main();
