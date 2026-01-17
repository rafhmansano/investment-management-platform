-- Tabela de Ativos
CREATE TABLE ativos (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ticker VARCHAR(20) UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    tipo VARCHAR(50) NOT NULL CHECK (tipo IN ('ACAO', 'FII', 'ETF')),
    setor TEXT,
    cotacao_atual DECIMAL(10,2),
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dados_json JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

-- Tabela de Indicadores Financeiros
CREATE TABLE indicadores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ativo_id UUID NOT NULL REFERENCES ativos(id) ON DELETE CASCADE,
    data_relatorio DATE NOT NULL,
    preco_lucro DECIMAL(10,2),
    preco_valor_patrimonial DECIMAL(10,2),
    dividend_yield DECIMAL(5,2),
    roe DECIMAL(5,2),
    roic DECIMAL(5,2),
    ativo_total DECIMAL(15,2),
    passivo_total DECIMAL(15,2),
    patrimonio_liquido DECIMAL(15,2),
    receita_liquida DECIMAL(15,2),
    lucro_liquido DECIMAL(15,2),
    ffo_yield DECIMAL(5,2),
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(ativo_id, data_relatorio)
  );

-- Tabela de Carteira
CREATE TABLE carteira (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ativo_id UUID NOT NULL REFERENCES ativos(id) ON DELETE CASCADE,
    quantidade DECIMAL(10,4) NOT NULL,
    preco_medio DECIMAL(10,2) NOT NULL,
    data_aquisicao DATE NOT NULL,
    objetivo VARCHAR(100),
    notas TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

-- Tabela de Regras de Valuation
CREATE TABLE valuation_rules (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tipo_ativo VARCHAR(50) NOT NULL,
    regra_nome VARCHAR(100) NOT NULL,
    parametro VARCHAR(50) NOT NULL,
    condicao VARCHAR(10) NOT NULL,
    valor_min DECIMAL(10,2),
    valor_max DECIMAL(10,2),
    acao_recomendada VARCHAR(50),
    ativa BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

-- Tabela de Oportunidades
CREATE TABLE oportunidades (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ativo_id UUID NOT NULL REFERENCES ativos(id) ON DELETE CASCADE,
    tipo_oportunidade VARCHAR(50) NOT NULL,
    score_atratividade DECIMAL(5,2),
    motivo TEXT,
    data_deteccao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao_recomendada VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

-- Criar índices para melhor performance
CREATE INDEX idx_ativos_tipo ON ativos(tipo);
CREATE INDEX idx_indicadores_ativo ON indicadores(ativo_id);
CREATE INDEX idx_carteira_ativo ON carteira(ativo_id);
CREATE INDEX idx_oportunidades_ativo ON oportunidades(ativo_id);
CREATE INDEX idx_oportunidades_data ON oportunidades(data_deteccao);

-- Habilitar RLS (Row Level Security)
ALTER TABLE ativos ENABLE ROW LEVEL SECURITY;
ALTER TABLE indicadores ENABLE ROW LEVEL SECURITY;
ALTER TABLE carteira ENABLE ROW LEVEL SECURITY;
ALTER TABLE valuation_rules ENABLE ROW LEVEL SECURITY;
ALTER TABLE oportunidades ENABLE ROW LEVEL SECURITY;
