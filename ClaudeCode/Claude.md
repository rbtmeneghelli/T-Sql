# CLAUDE.md – Instruções do Projeto (.NET)

## Arquitetura

Este projeto segue Clean Architecture com separação em camadas: Domain, Application, Infrastructure e API.
Nunca misture lógica de negócio na camada de API.

## Tech stack

- .NET 10 / C#
- ASP.NET Core (Minimal APIs)
- EF Core
- Redis para cache
- Application Insights para logs e métricas
- Entity Framework Core com Microsoft SQL Server

## Estrutura da solução

- `Domain`: Entidades, interfaces de repositório e lógica de domínio pura.
- `Application`: DTOs, Mappers, Commands/Queries (MediatR) e Interfaces de serviço.
- `Infrastructure`: Implementação de repositórios (Dapper/EF), Redis, acesso a API externas via clientes Http e persistência com o banco de dados, migrations.
- `API`: Controllers/Endpoints, Injeção de Dependência, Middlewares e Configurações (Startup).
- `Test`: testes de unidade e integração

## Regras de Dependência
- A camada `Domain` nunca deve referenciar nenhuma outra.
- A `API` deve referenciar `Application` e `Infrastructure` para o Setup da DI.

## Convenções

- Endpoints mapeados com Minimal API
- Handlers seguem o padrão CQRS com MediatR
- Repositórios são interfaces definidas em Application e implementadas em Infrastructure
- Utilizar async/await sempre que aplicavel
- Utilizar injeção de dependência nativa do ASP.NET Core
- Evitar duplicação de código
- Seguir princípios SOLID quando aplicável
- Utilizar EF Core como mecanismo de persistência
- Utilizar Microsoft SQL Server como banco de dados local
- Priorizar legibilidade e manutenção do código
- Usar AsNoTracking para leitura
- Preferir projeção com Select
- Evitar N+1
- Não usar repository genérico
- Sempre passe CancellationToken em chamadas assíncronas (async/await).
- Jamais use "sync over async" (síncrono sobre assíncrono).
- Não Adicionar frameworks que não são mais utilizado.
- Não introduzir novas camadas arquiteturais.
- Não use `new` para instanciar serviços registrados no contêiner.
- Não modifique arquivos fora do escopo da tarefa.
- Não refatore código funcional sem instrução explícita.
- Não use Task.Run em manipuladores de requisição.
- Chamadas HTTP externas devem ter timeouts e cancelamento.
- O cache deve considerar orçamentos de tempo e proteção contra stampede.
- Nunca usar .Result ou .Wait() — causa deadlock em ASP.NET Core
- Mapeamento entre DTO e entidades deve ser feito de forma manual, sem uso de pacotes externos
- Não colocar lógica de negócio nos controllers e Handlers de commands/queries
- Não criar migrations sem revisar o SQL gerado (`dotnet ef migrations script`)
- Aplicas Testes com xUnit + Moq
- Aplicar migrations com Entity Framework Core

## Fluxo de Trabalho (Workflow)

1. Faça perguntas de esclarecimento se os requisitos não estiverem claros.
2. Proponha um plano e liste os arquivos a serem alterados.
3. Implemente a menor mudança viável.
4. Adicione ou atualize testes quando apropriado.
5. Forneça comandos para verificar as mudanças.

## Pacotes aprovados

- MediatR
- FluentValidation
- Scalar
- Dapper (apenas para queries de leitura complexas)
- EF Core (apenas para queries simples de leitura e para ações de escrita)
- Nunca adicione Entity Framework Core sem aprovação explícita

## Comandos
- Rodar testes:          dotnet test
- Build:                 dotnet build
- Aplicar migrations:    dotnet ef database update --project src/Infrastructure
- Nova migration:        dotnet ef migrations add NomeDaMigration --project src/Infrastructure --startup-project src/Api
- Executar projeto: 	 dotnet run --project src/Api