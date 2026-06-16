# CLAUDE.md

## Arquitetura

- Este projeto segue Clean Architecture com separação em camadas: Domain, Application, Infrastructure e API.
- Nunca misture lógica de negócio na camada de API.
- Endpoints chamam Handlers (Commands ou Queries).
- Handlers chamam Services.
- Services chamam Repositories.
- Services contêm regras de negócio.
- Repositórios são responsáveis pelo acesso a dados.
- Nunca acessar o DbContext diretamente a partir de Endpoints, Handlers e Services.
- Sempre utilizar Injeção de Dependência.
- Respeitar o princípio da responsabilidade única (SRP).
- A camada Domain nunca deve referenciar nenhuma outra camada.
- A API deve referenciar Application e Infrastructure para configuração da Injeção de Dependência.
- Todo Command deve possuir Validator utilizando FluentValidation.
- Utilizar TypedResults sempre que possível.

---

## Estrutura da solução

### Domain

- Entidades
- Interfaces de Repositório

### Application

- Interfaces de Serviço
- Commands
- Queries
- DTOs
- Validators
- Result Pattern
- Mappers manuais entre DTOs e Entidades

### Infrastructure
- Implementação de repositórios (Entity Framework Core / Dapper)
- Implementação de Cache Redis
- Clientes HTTP para integrações externas
- Persistência SQL Server
- Migrations

### API

- Endpoints
- Injeção de Dependência
- Middlewares
- Configurações (Startup)
- Exception Handlers

### Tests

- Testes Unitários
- Testes de Integração

---

## Stack

- .NET 10
- ASP.NET Core Minimal APIs
- C#
- Entity Framework Core
- Dapper
- Redis
- Application Insights
- SQL Server

---

## Pacotes aprovados

- xUnit
- FluentAssertions
- Moq
- MediatR
- FluentValidation
- Scalar

### ORM

- Entity Framework Core é o ORM oficial do projeto.
- Dapper é permitido apenas para consultas complexas de leitura.
- Não adicionar outros ORMs sem aprovação explícita.

---

## Convenções (PAREI AQUI)
- Handlers seguem o padrão CQRS com MediatR
- Utilizar async/await sempre que aplicavel
- Utilizar injeção de dependência nativa do ASP.NET Core
- Utilizar Microsoft SQL Server como banco de dados local
- Utilizar `AsNoTracking()` para consultas somente leitura
- Evitar consultas N+1
- Sempre passe CancellationToken em chamadas assíncronas (async/await).
- Chamadas HTTP externas devem ter timeouts e cancelamento.
- O cache deve considerar orçamentos de tempo e proteção contra stampede.
- Mapeamento entre DTO e entidades deve ser feito de forma manual, sem uso de pacotes externos
- Preferir consultas assíncronas

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

## Observabilidade

- Todos os Handlers devem registrar logs de início, sucesso e falha.
- Nunca registrar dados sensíveis.
- Utilizar Application Insights para correlação de requests.

## Banco de Dados

- Toda tabela deve possuir um campo `Id` como chave primária explícita do tipo int e configurado com Identity.
- Todas as entidades devem utilizar ter o campo `Id`, `UserCreatedId`,`CreatedDate`,`UserUpdatedId`,`UpdateDate`,`UserDeletedId`,`DeletedDate`,
- Utilizar índices para colunas de busca frequente.
- Configurações de Fluent API do Entity Framework devem ficar em classes separadas.
- Utilizar migrations para alterações de banco de dados
- Não criar migrations sem revisar o SQL gerado (`dotnet ef migrations script`)

## Tratamento de Erros

- Services não devem lançar exceptions para regras de negócio esperadas.
- Utilizar Result Pattern para retornar falhas de negócio.
- Exceptions devem ser reservadas para falhas inesperadas.
- GlobalExceptionHandler é responsável por erros não tratados.

## Consultas

- Endpoints de listagem devem suportar paginação.
- Utilizar parâmetros pageNumber e pageSize.
- pageSize máximo: 100.

## Cache

- Cache apenas para consultas.
- Nunca utilizar cache para comandos de escrita.
- Chaves devem seguir o padrão:
  {entidade}:{identificador}
- Invalidar cache após operações de escrita.

## DTOs

- Nunca expor entidades de domínio diretamente nos endpoints.
- Endpoints devem receber Request DTOs.
- Endpoints devem retornar Response DTOs.

## Testes

- Todo Handler deve possuir testes unitários.
- Todo Service com regra de negócio deve possuir testes unitários.
- Repositórios não precisam de testes unitários.

## Endpoints

- Todos os endpoints serão mapeados como Minimal API
- Nenhuma validação de negócio deve ficar no Endpoint.
- Todos os endpoints devem possuir tags para documentação Scalar.
- Todos os endpoints devem possuir versionamento (/api/v1).
- Todos os endpoints devem declarar explicitamente Produces e ProducesProblem.

## Result Pattern

- Utilizar uma implementação própria de Result e Result<T>.
- Result deve conter:
  - IsSuccess
  - Error
- Result<T> deve conter:
  - IsSuccess
  - Value
  - Error
- Não utilizar bibliotecas externas para Result Pattern.