# 📈 Plataforma de Gestão de Investimentos

> Uma solução web completa para gerenciar e analisar seus investimentos em ações, FIIs e ETFs com sistemas de valuation inteligentes e detecção automática de oportunidades.
>
> ![GitHub License](https://img.shields.io/badge/license-MIT-green)
> ![GitHub Last Commit](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
>
> ## 🎯 Características Principais
>
> - **Dashboard Inteligente**: Visualize sua carteira em tempo real
> - - **Análise de Valuation**: P/E, DY, VPA, ROE, FFO para FIIs
>   - - **Motor de Regras**: Configure suas próprias estratégias de investimento
>     - - **Detector de Oportunidades**: Identifique automaticamente boas oportunidades
>       - - **Gestão de Carteira**: Acompanhe preço médio, quantidade e performance
>         - - **Integração com Supabase**: Banco de dados PostgreSQL robusto
>           - - **API RESTful**: Backend pronto para escalar
>            
>             - ## 🚀 Stack Técnico
>            
>             - ### Frontend
>             - - Next.js 14+ com React 18
>               - - Tailwind CSS para styling
> - Chart.js para gráficos
> - - Shadcn/ui para componentes
>  
>   - ### Backend
>   - - Node.js + Express
>     - - Supabase PostgreSQL
>       - - APIs de dados financeiros integradas
>         - - Scheduled jobs para atualização automática
>          
>           - ### Database
>           - - PostgreSQL (via Supabase)
>             - - Row Level Security (RLS)
>               - - Migrations versionadas
>                
>                 - ## 📁 Estrutura do Projeto
>                
>                 - ```
>                   investment-management-platform/
>                   ├── backend/
>                   │   ├── src/
>                   │   │   ├── server.js           # Servidor principal
>                   │   │   ├── routes/             # Rotas da API
>                   │   │   ├── middleware/         # Middlewares
>                   │   │   └── utils/              # Funções auxiliares
>                   │   ├── scripts/                # Scripts de migração
>                   │   └── package.json
>                   │
>                   ├── frontend/
>                   │   ├── src/
>                   │   │   ├── components/         # Componentes React
>                   │   │   ├── pages/              # Páginas Next.js
>                   │   │   ├── hooks/              # Custom hooks
>                   │   │   └── styles/             # Estilos globais
>                   │   └── package.json
>                   │
>                   ├── database/
>                   │   ├── migrations/             # Scripts SQL
>                   │   └── seeds/                  # Dados iniciais
>                   │
>                   ├── docs/
>                   │   ├── SETUP.md               # Guia de configuração
>                   │   ├── API.md                 # Documentação da API
>                   │   └── VALUATION_RULES.md     # Configuração de regras
>                   │
>                   └── README.md
>                   ```
>
> ## 🔧 Quick Start
>
> ### Pré-requisitos
> - Node.js 16+
> - - npm ou yarn
>   - - Conta Supabase
>    
>     - ### Instalação
>    
>     - ```bash
>       # Clonar repositório
>       git clone https://github.com/rafhmansano/investment-management-platform.git
>       cd investment-management-platform
>
>       # Backend
>       cd backend
>       npm install
>       cp .env.example .env
>       npm run dev
>
>       # Frontend (em outro terminal)
>       cd frontend
>       npm install
>       npm start
>       ```
>
> Veja [docs/SETUP.md](docs/SETUP.md) para instruções detalhadas.
>
> ## 📊 Funcionalidades Detalhadas
>
> ### Dashboard
> - Resumo da carteira com valores atualizados
> - - Gráficos de performance
>   - - Alertas de oportunidades
>     - - Últimas transações
>      
>       - ### Análise de Ativos
>       - - Ficha técnica completa do ativo
>         - - Histórico de cotações
>           - - Indicadores financeiros
>             - - Comparação com pares
>              
>               - ### Motor de Valuation
>               - Configure regras como:
>               - ```
>                 Se P/E < 12 E DY > 3% ENTÃO COMPRAR
>                 Se FFO_YIELD < 4% ENTÃO VENDER
>                 ```
>
> ### Detector de Oportunidades
> - Análise automática de screening
> - - Score de atratividade
>   - - Notificações em tempo real
>     - - Histórico de oportunidades
>      
>       - ## 📚 Documentação
>      
>       - - [SETUP.md](docs/SETUP.md) - Guia de instalação e configuração
>         - - [API.md](docs/API.md) - Documentação da API REST
>           - - [VALUATION_RULES.md](docs/VALUATION_RULES.md) - Como configurar regras de investimento
>            
>             - ## 🗄️ Database Schema
>            
>             - Principais tabelas:
>             - - `ativos` - Masterdata de ativos
>               - - `indicadores` - Dados financeiros históricos
> - `carteira` - Holdings do usuário
> - - `valuation_rules` - Regras de estratégia
>   - - `oportunidades` - Oportunidades detectadas
>    
>     - Execute as migrations em Supabase:
>     - ```sql
>       -- Ver database/migrations/001_create_tables.sql
>       ```
>
> ## 🔐 Segurança
>
> - Row Level Security ativado em todas as tabelas
> - - Validação de entrada em todas as rotas
>   - - Autenticação via JWT
>     - - CORS configurado
>      
>       - ## 🤝 Contribuindo
>      
>       - Contribuições são bem-vindas! Por favor:
>      
>       - 1. Faça um Fork do projeto
> 2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
> 3. 3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
>    4. 4. Push para a branch (`git push origin feature/AmazingFeature`)
>       5. 5. Abra um Pull Request
>         
>          6. ## 📝 Licença
>         
>          7. Este projeto está sob licença MIT - veja [LICENSE](LICENSE) para detalhes.
>         
>          8. ## 👨‍💻 Autor
>
> Rafael Mansano
>
> ## 🙋 Suporte
>
> Para dúvidas ou issues, abra uma [Issue no GitHub](https://github.com/rafhmansano/investment-management-platform/issues).
>
> ---
>
> **Status**: Em Desenvolvimento 🚧
> **Última Atualização**: Janeiro 2026
> **Versão**: 0.1.0-beta
