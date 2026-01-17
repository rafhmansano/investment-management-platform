# Guia de Setup - Plataforma de Gestão de Investimentos

## Pré-requisitos

- Node.js 16+ e npm
- - Conta no Supabase (supabase.com)
  - - Git
    - - Editor de código (VS Code recomendado)
     
      - ## Instalação Backend
     
      - ### 1. Clonar o repositório
      - \`\`\`bash
      - git clone https://github.com/rafhmansano/investment-management-platform.git
      - cd investment-management-platform/backend
      - \`\`\`
     
      - ### 2. Instalar dependências
      - \`\`\`bash
      - npm install
      - \`\`\`
     
      - ### 3. Configurar variáveis de ambiente
      - Crie um arquivo \`.env\` na pasta backend:
     
      - \`\`\`env
      - SUPABASE_URL=sua_url_supabase
      - SUPABASE_KEY=sua_chave_anonima
      - PORT=3001
      - NODE_ENV=development
      - \`\`\`
     
      - ### 4. Executar o servidor
      - \`\`\`bash
      - npm run dev
      - \`\`\`
     
      - O servidor rodará em http://localhost:3001
     
      - ## Setup Supabase
     
      - ### 1. Criar Projeto
      - 1. Acesse supabase.com
        2. 2. Clique em "New Project"
           3. 3. Preencha as informações
             
              4. ### 2. Executar Migrations
              5. 1. Na pasta \`database/migrations\`, copie o SQL
                 2. 2. Execute no Supabase SQL Editor
                   
                    3. ### 3. Configurar Permissões (RLS)
                    4. - Ativar Row Level Security em todas as tabelas
                       - - Configurar políticas de acesso
                        
                         - ## Instalação Frontend
                        
                         - ### 1. Entrar na pasta frontend
                         - \`\`\`bash
                         - cd ../frontend
                         - npm install
                         - \`\`\`
                        
                         - ### 2. Configurar .env.local
                         - \`\`\`env
                         - REACT_APP_SUPABASE_URL=sua_url_supabase
                         - REACT_APP_SUPABASE_KEY=sua_chave_anonima
                         - REACT_APP_API_URL=http://localhost:3001
                         - \`\`\`
                        
                         - ### 3. Rodar frontend
                         - \`\`\`bash
                         - npm start
                         - \`\`\`
                        
                         - Frontend estará em http://localhost:3000
                        
                         - ## Estrutura de Pastas
                        
                         - ```
                           investment-management-platform/
                           ├── backend/
                           │   ├── src/
                           │   │   ├── server.js
                           │   │   ├── routes/
                           │   │   ├── middleware/
                           │   │   └── utils/
                           │   ├── scripts/
                           │   └── package.json
                           ├── frontend/
                           │   ├── src/
                           │   │   ├── components/
                           │   │   ├── pages/
                           │   │   └── hooks/
                           │   └── package.json
                           ├── database/
                           │   ├── migrations/
                           │   └── seeds/
                           └── docs/
                           ```

                           ## Troubleshooting

                           ### Erro de conexão Supabase
                           - Verifique SUPABASE_URL e SUPABASE_KEY
                           - - Confirme que as tabelas foram criadas
                            
                             - ### Porta 3001 em uso
                             - \`\`\`bash
                             - lsof -i :3001
                             - kill -9 <PID>
                             \`\`\`

## Próximos Passos

1. Criar as tabelas no Supabase (veja database/migrations)
2. 2. Configurar as APIs de dados financeiros
   3. 3. Implementar autenticação
      4. 4. Fazer deploy
