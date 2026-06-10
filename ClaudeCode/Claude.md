#PortalCopa26

## Projeto

Portal informativo da copa do mundo 2026 focado em consulta de jogos, grupos, seleções, ranking FIFA e simulação de resultados.

---

## Tecnologias

- .NET 10
- EF Core
- Microsoft SQL Server

---

## Arquitetura
A aplicação será desenvolvimento em um projeto no modelo de WebAPI com 

### Organização

- PASTAS E ETC

O código deve ser organizado no modelo de arquitetura limpa

---

## Escopo

- Paises-sede
- Próximos jogos
- Ranking FIFA : Grafico
- Chamada para simulador

### Jogos

# Regras do projeto
- Usar EF Core com boas práticas
- Evitar N+1
- Sempre usar async/await
- Não usar repository genérico
- Preferir projeção com Select
- Usar AsNoTracking para leitura