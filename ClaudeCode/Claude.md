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

## Convenções
- Utilizar CQRS com MediatR.
- Utilizar async/await sempre que aplicavel
- Utilizar injeção de dependência nativa do ASP.NET Core
- Utilizar AsNoTracking() para consultas somente leitura.
- Evitar consultas N+1
- Sempre passar CancellationToken em operações assíncronas.
- Chamadas HTTP externas devem ter timeouts e cancelamento.
- Mapeamento entre DTOs e entidades deve ser manual.
- Preferir consultas assíncronas
- Não utilizar bibliotecas de AutoMapper.

---

## Convenções de Nomenclatura
- Classes: PascalCase
- Interfaces: prefixo `I` (`IClientService`)
- Métodos: PascalCase
- Propriedades: PascalCase
- Campos privados: `_camelCase`
- Variáveis locais e parâmetros: `camelCase`
- Constantes: PascalCase
- Arquivos: mesmo nome da classe principal

---

## Workflow

1. Fazer perguntas de esclarecimento quando necessário.
2. Apresentar plano de implementação.
3. Listar arquivos que serão criados ou alterados.
4. Implementar a menor mudança viável.
5. Atualizar ou criar testes quando necessário.
6. Fornecer comandos para validação.

---

## Restrições

- Nunca usar `dynamic` sem justificativa explícita
- Habilitar Nullable Reference Types
- Evitar lógica de negócio em Endpoints e Handlers.
- Evitar métodos excessivamente longos
- Evitar duplicação de código
- Priorizar legibilidade e manutenção
- Nunca introduzir novas camadas arquiteturais
- Nunca adicionar frameworks não aprovados
- Nunca utilizar Task.Run em requisições.
- Nunca utilizar repositório genérico
- Nunca modificar arquivos fora do escopo solicitado
- Nunca refatorar código funcional sem solicitação explícita
- Nunca utilizar .Result ou .Wait()
- Nunca utilizar sync-over-async.
- Nunca instanciar serviços registrados no container utilizando new.

### Escrita de Dados

- Operações de escrita devem utilizar Entity Framework Core.
- Operações de escrita não devem utilizar Dapper.
- SaveChangesAsync deve sempre receber CancellationToken.

---

## Endpoints

- Todos os endpoints serão mapeados como Minimal API
- Nenhuma validação de negócio deve ser implementada diretamente no Endpoint.
- Todos os endpoints devem possuir tags para documentação Scalar.
- Todos os endpoints devem possuir versionamento (/api/v1).
- Todos os endpoints devem declarar Produces().
- Todos os endpoints devem declarar ProducesProblem().
- Endpoints devem apenas orquestrar a chamada para Commands ou Queries

---

## DTOs

- Nunca expor entidades de domínio diretamente pela API.
- Endpoints devem receber Request DTOs.
- Endpoints devem retornar Response DTOs.
- DTOs não devem conter lógica de negócio

---

## Validação

- Todo Command deve possuir um Validator utilizando FluentValidation.
- Validators devem conter apenas validações de entrada e formato.
- Regras de negócio devem ficar na camada Service.
- Nenhuma validação deve ser implementada diretamente nos Endpoints.

---

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
- Result e Result<T> devem estar localizados na camada Application.

---

## Tratamento de Erros

- Services não devem lançar exceptions para regras de negócio esperadas.
- Utilizar Result Pattern para retornar falhas de negócio.
- Implementar GlobalExceptionHandler.
- Utilizar ProblemDetails para respostas de erro.
- Nunca expor detalhes internos de Exceptions para clientes.

---

## Observabilidade

- Utilizar Application Insights.
- Correlacionar requests automaticamente.
- Registrar métricas e exceções relevantes.
- Nunca registrar dados sensíveis.

---

## Banco de Dados

- Toda tabela deve possuir campo Id.

- Id deve ser int Identity.

- Todas as entidades devem possuir:

	-  Id
	-  UserCreatedId
	-  CreatedDate
	-  UserUpdatedId
	-  UpdatedDate
	-  UserDeletedId
	-  DeletedDate

- Utilizar índices para colunas frequentemente pesquisadas.

- Configurações Fluent API devem estar em classes separadas.

- Utilizar migrations para alterações de banco.

- Revisar SQL gerado antes da aplicação de migrations.

- Nomes de tabelas são no plural
---

## Datas

- Todas as datas devem ser armazenadas em UTC.
- Utilizar DateTime.UtcNow.
- Nunca utilizar horário local do servidor para persistência.

---

## Exclusão

- Utilizar Soft Delete.

- Não remover registros fisicamente do banco.

- Exclusões devem preencher:

	-  UserDeletedId
	-  DeletedDate

- Consultas padrão não devem retornar registros excluídos.

- Utilizar Query Filters globais do Entity Framework quando aplicável.

---

## Consultas

- Endpoints de listagem devem suportar paginação.
- Utilizar pageNumber.
- Utilizar pageSize.
- pageSize máximo: 100.
- Consultas devem ignorar registros excluídos.

### Resposta Paginada

Deve conter:

- Items
- TotalRecords
- PageNumber
- PageSize
- TotalPages

---

## Cache

- Utilizar cache apenas para consultas.
- Nunca utilizar cache em operações de escrita.
- Invalidar cache após alterações.
- Utilizar padrão de chave:

{entidade}:{identificador}

- Considerar proteção contra cache stampede.
- Considerar timeout e orçamento de execução.

---

## Performance

- Utilizar AsNoTracking() em consultas somente leitura.
- Evitar consultas N+1.
- Evitar carregamento desnecessário de entidades.
- Utilizar projeções para DTOs quando apropriado.
- Preferir operações assíncronas.

---

## Segurança

- Validar toda entrada recebida pela API.
- Utilizar parâmetros em consultas SQL.
- Nunca expor detalhes internos de exceções.
- Nunca registrar informações sensíveis.
- Utilizar ProblemDetails para erros.

---

## Testes

### Obrigatórios

* Todo Handler deve possuir testes unitários.
* Todo Service contendo regra de negócio deve possuir testes unitários.

### Não Obrigatórios

* Repositórios não precisam de testes unitários.

### Frameworks

* xUnit
* FluentAssertions
* Moq

---

## Comandos

### Executar testes

dotnet test

### Build

dotnet build

### Aplicar migrations

dotnet ef database update --project src/Infrastructure

### Criar migration

dotnet ef migrations add NomeDaMigration --project src/Infrastructure --startup-project src/Api

### Executar aplicação

dotnet run --project src/Api

---

## Geração de Código

- Siga as C# Coding Conventions (Microsoft)
- Prefira async/await para todas as operações de I/O
- Priorizar simplicidade e manutenibilidade.
- Considerar performance, segurança e testabilidade.
- Explicar decisões arquiteturais não óbvias.
- Não omitir arquivos necessários para a implementação.
- Respeitar rigorosamente todas as regras deste documento.
- Utilize Dependency Injection (DI) nativa para gerenciamento de serviços

---