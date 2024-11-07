CREATE function fnDatas2(@ano smallint, @mes tinyint)

returns @datas table (data smalldatetime)

as

begin

declare @dataInicial datetime

declare @dataFinal datetime

SELECT @dataInicial = cast(@ano as varchar(4))+ '-' +cast(@mes as varchar(2)) + '- 01'

SELECT @dataFinal = DATEADD(DAY,-1,DATEADD(MONTH,1,@dataInicial))

WHILE @dataInicial <= @dataFinal

begin

insert into @datas values (@dataInicial)

SELECT @dataInicial = DATEADD(DAY,1,@dataInicial)

end

return

end