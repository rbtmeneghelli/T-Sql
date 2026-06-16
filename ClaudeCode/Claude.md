# CLAUDE.md

## Arquitetura

- Este projeto segue Clean Architecture com separação em camadas: Domain, Application, Infrastructure e API
- Nunca misture lógica de negócio na camada de API
- Controllers chamam Handlers(Command ou Queries)
- Handlers chamam Services
- Services chamam Repositories
- Services contêm regras de negócio
- Repositórios são responsáveis pelo acesso a dados
- Nunca acessar o DbContext diretamente a partir de Controllers, Handlers e Services
- Sempre usar Injeção de Dependência
- Respeitar o princípio da responsabilidade única (SRP)
- A camada `Domain` nunca deve referenciar nenhuma outra.
- A `API` deve referenciar `Application` e `Infrastructure` para o Setup da DI.

## Estrutura da solução

- `Domain`: Entidades, interfaces de repositório e lógica de domínio pura.
- `Application`: DTOs, Mappers, Commands/Queries (MediatR) e Interfaces de serviço.
- `Infrastructure`: Implementação de repositórios (Dapper/EF), Redis, acesso a API externas via clientes Http e persistência com o banco de dados, migrations.
- `API`: Controllers/Endpoints, Injeção de Dependência, Middlewares e Configurações (Startup).
- `Test`: testes de unidade e integração

## Stack

- .NET 10
- ASP.NET Core (Minimal APIs)
- C#
- Entity Framework Core
- Redis para cache
- Application Insights para logs e métricas
- Microsoft SQL Server

## Testes

- xUnit
- FluentAssertions
- Moq

## Restrições

- Nunca usar `dynamic` sem justificativa explícita
- Habilitar Nullable Reference Types
- Evitar lógica de negócio em Controllers e Handlers
- Evitar métodos excessivamente longos (preferir métodos pequenos e focados)
- Evitar duplicação de código
- Priorizar código legível sobre soluções excessivamente complexas
- Nunca introduzir novas camadas arquiteturais
- Nunca adicionar frameworks que não são mais utilizado
- Nunca use Task.Run em manipuladores de requisição.
- Nunca utilizar repositório genérico
- Nunca modifique arquivos fora do escopo da tarefa
- Nunca refatore código funcional sem instrução explícita
- Nunca usar .Result ou .Wait() — causa deadlock em ASP.NET Core
- Nunca use "sync over async" (síncrono sobre assíncrono).
- Não use `new` para instanciar serviços registrados no contêiner.

## Convenções Aceitas
- Endpoints mapeados com Minimal API
- Handlers seguem o padrão CQRS com MediatR
- Repositórios são interfaces definidas em Application e implementadas em Infrastructure
- Utilizar async/await sempre que aplicavel
- Utilizar injeção de dependência nativa do ASP.NET Core
- Utilizar Microsoft SQL Server como banco de dados local
- Utilizar `AsNoTracking()` para consultas somente leitura
- Evitar consultas N+1
- Sempre passe CancellationToken em chamadas assíncronas (async/await).
- Chamadas HTTP externas devem ter timeouts e cancelamento.
- O cache deve considerar orçamentos de tempo e proteção contra stampede.
- Mapeamento entre DTO e entidades deve ser feito de forma manual, sem uso de pacotes externos
- Não criar migrations sem revisar o SQL gerado (`dotnet ef migrations script`)
- Utilizar migrations para alterações de banco de dados
- Preferir consultas assíncronas
- Configurações Fluent API devem ficar em classes separadas

## Convenções de Nomenclatura
- Classes: PascalCase
- Interfaces: prefixo `I` (`IClientService`)
- Métodos: PascalCase
- Propriedades: PascalCase
- Campos privados: `_camelCase`
- Variáveis locais e parâmetros: `camelCase`
- Constantes: PascalCase
- Arquivos: mesmo nome da classe principal

## Fluxo de Trabalho (Workflow)

1. Faça perguntas de esclarecimento se os requisitos não estiverem claros.
2. Proponha um plano e liste os arquivos a serem alterados.
3. Implemente a menor mudança viável.
4. Adicione ou atualize testes quando apropriado.
5. Forneça comandos para verificar as mudanças.

## Pacotes aprovados

- xUnit
- moq
- MediatR
- FluentValidation
- Scalar
- Dapper (apenas para queries de leitura complexas)
- EF Core (apenas para queries simples de leitura e para ações de escrita)
- Nunca adicione Entity Framework Core sem aprovação explícita

## Código

- Gerar código seguindo os padrões oficiais da Microsoft
- Priorizar simplicidade e manutenibilidade
- Sempre considerar performance, segurança e testabilidade
- Explicar decisões arquiteturais quando elas não forem óbvias

## Comandos

- Rodar testes:          dotnet test
- Build:                 dotnet build
- Aplicar migrations:    dotnet ef database update --project src/Infrastructure
- Nova migration:        dotnet ef migrations add NomeDaMigration --project src/Infrastructure --startup-project src/Api
- Executar projeto: 	 dotnet run --project src/Api