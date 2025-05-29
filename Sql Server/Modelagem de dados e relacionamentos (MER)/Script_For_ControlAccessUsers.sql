create table [Rule](
Id bigint identity(1,1) PRIMARY KEY,
Description varchar(255),
RoleTag varchar(80),
CreatedAt Datetime,
ChangedAt Datetime,
IsActive bit)

insert into [Rule] values('Cadastro','ROLE_USER_ADD',getdate(),null,1),
('Edição','ROLE_USER_EDIT',getdate(),null,1),
('Excluir','ROLE_USER_DEL',getdate(),null,1),
('Consultar','ROLE_USER_VIEW',getdate(),null,1)

create table Operation(
Id bigint identity(1,1) PRIMARY KEY,
Id_Principal bigint null,
Description varchar(255),
Link varchar(100),
Icon varchar(20),
OperationLevel int,
[Order] int,
CreatedAt Datetime,
ChangedAt Datetime,
IsActive bit,
foreign key (Id_Principal) references Operation(Id))

insert into Operation values
(null,'Home',null,'card',0,1,getdate(),null,1),
(null,'Administrativo',null,'card',0,2,getdate(),null,1),
(2,'Usuario',null,'card',1,1,getdate(),null,1),
(null,'Financeiro',null,'card',0,3,getdate(),null,1),
(4,'Banco',null,'card',1,1,getdate(),null,1),
(null,'Manual do Financeiro',null,'card',1,1,getdate(),null,1)

create table [Profile](
Id bigint identity(1,1) PRIMARY KEY,
Description varchar(255),
CreatedAt Datetime,
ChangedAt Datetime,
IsActive bit)

insert into [Profile] values('Administrator',getdate(),null,1),('User',getdate(),null,1)

create table [User](
Id bigint identity(1,1) PRIMARY KEY,
IdProfile bigint,
Login varchar(10) UNIQUE not null,
Password varchar(10),
Email varchar(80) UNIQUE not null,
CreatedAt Datetime,
ChangedAt Datetime,
TwoFactoryAccess bit,
IsActive bit,
foreign key (idProfile) references [Profile](Id))

insert into [User] values(1,'XPTO','1234','xpto@gmail.com',getdate(),null,0,1)
insert into [User] values(1,'XYZ','5678','xyz@gmail.com',getdate(),null,1,1)

create table ProfileOperations(
IdProfile bigint not null,
IdOperation bigint not null,
foreign key (IdProfile) references [Profile](Id),
foreign key (IdOperation) references [Operation](Id)
)

insert into ProfileOperations values(1,1)
insert into ProfileOperations values(1,2)
insert into ProfileOperations values(1,3)
insert into ProfileOperations values(1,4)
insert into ProfileOperations values(1,5)
insert into ProfileOperations values(1,6)

create table OperationRules(
IdOperation bigint not null,
IdRule bigint not null,
foreign key (IdOperation) references [Operation](Id),
foreign key (IdRule) references [Rule](Id)
)

insert into OperationRules values(3,1)
insert into OperationRules values(3,2)
insert into OperationRules values(3,3)
insert into OperationRules values(3,4)

select * from [Profile]
select * from [User]
select * from [Operation]
select * from ProfileOperations
select * from [Rule]
select * from [OperationRules]

create table UserOperationRules(
IdUser bigint not null,
IdOperation bigint not null,
IdRule bigint not null,
IsChecked bit not null default 0,
foreign key (IdUser) references [User](Id),
foreign key (IdOperation) references [Operation](Id),
foreign key (IdRule) references [Rule](Id)
)

insert into UserOperationRules values(1,1,4,1),(1,2,4,1),(1,3,1,1),(1,3,2,1),(1,3,3,1),(1,3,4,1)

-- Query Padrão para Montagem da tela de Perfil para cadastro
select _operation.Description, _operation.OperationLevel, _operation.[Order], ISNULL(_operation.Id_Principal,_operation.Id) as IdOperacao, 
[Rule].Description from [Profile] _profile
join ProfileOperations _profileOp on _profile.Id = _profileOp.IdProfile
join Operation _operation on _profileOp.IdOperation = _operation.Id
left join OperationRules _operationR on _operation.Id = _operationR.IdOperation
left join [Rule] on _operationR.IdRule = [Rule].Id
where _profile.Id = 1 and _profile.IsActive = 1 and _operation.IsActive = 1
group by _operation.Description, _operation.OperationLevel, _operation.[Order], ISNULL(_operation.Id_Principal,_operation.Id),[Rule].Description
order by _operation.OperationLevel, _operation.[Order], ISNULL(_operation.Id_Principal,_operation.Id),[Rule].Description

-- Query Padrão para Montagem da tela de Perfil para usuario ja cadastrado, com base em suas escolhas da query acima!
select _operation.Description, _operation.OperationLevel, _operation.[Order], ISNULL(_operation.Id_Principal,_operation.Id) as IdOperacao, 
STRING_AGG([Rule].RoleTag, ';') AS RoleTags
from [User] _user
join UserOperationRules _userOperationRules on _user.Id = _userOperationRules.IdUser
join Operation _operation on _userOperationRules.IdOperation = _operation.Id
left join [Rule] on _userOperationRules.IdRule = [Rule].Id
where _operation.IsActive = 1
group by _operation.Description, _operation.OperationLevel, _operation.[Order], ISNULL(_operation.Id_Principal,_operation.Id)
order by _operation.OperationLevel, _operation.[Order], ISNULL(_operation.Id_Principal,_operation.Id)

-- Em caso de uma funcionalidade ser retirada ou add, lembrar de mexer na tabela de UserOperationRules!
-- Em caso do usuario trocar o seu perfil, deve-se limpar os dados da tabela UserOperationRules e add novamente!

-- Verificar a quantidade de OperationLevel. (Um menu de tres niveis seria 3 foreach)...
-- List<Menu> menus = new();
-- menus.AddRange(lista.where(x => x.OperationLevel = 0).Orderby(x => x.Order)); --Adicionar ordenado e seguir a ordem
-- foreach(var item in menus) 
-- {
	-- foreach(var submenu in lista.where(x => x.IdOperacao == item.IdOperacao && x.OperationLevel == 1)){
	-- item.SubMenu.Add(SubMenu);
	--}
	-- foreach(var submenu2 in lista.where(x => x.IdOperacao == submenu.IdOperacao && x.OperationLevel == 2)); --Obter a lista com valores ordenados pelo campo Order
	-- item.SubMenu.Sub.Add(subMenu2);
	-- }
-- }

--drop table [Profile]
--drop table [User]
--drop table [Operation]
--drop table ProfileOperations
--drop table [Rule]
--drop table [OperationRules]