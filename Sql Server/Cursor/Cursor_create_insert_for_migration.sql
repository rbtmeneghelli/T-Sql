DECLARE @Script VARCHAR(MAX) = '';
DECLARE @TableResult TABLE(script varchar(MAX));

DECLARE @Id INT = 1;
DECLARE @TableName VARCHAR(MAX) = 'Table';
DECLARE @ClassName VARCHAR(MAX) = 'Table'

DECLARE @Param1 VARCHAR(MAX), @Param2 VARCHAR(MAX);

DECLARE db_cursor CURSOR FOR 
select name, Status = IIF(ISNULL(RemovedDate,'') = '', Status, 0) from Table
OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @Param1, @Param2  
WHILE @@FETCH_STATUS = 0  
BEGIN  
	SET @Script = 'Insert.IntoTable(nameof(' + @TableName + ')).Row(new ' + @ClassName + '
				   {
					   Id = ' + CAST(@Id AS VARCHAR) + ', Name = ' + '"' + @Param1 + '"' + ', StatusId = ' + @Param2 + '
				   });'

	INSERT INTO @TableResult values(@Script)
	SET @Id = @Id + 1
    FETCH NEXT FROM db_cursor INTO @Param1, @Param2 
END 
CLOSE db_cursor  
DEALLOCATE db_cursor

SELECT * from @TableResult
