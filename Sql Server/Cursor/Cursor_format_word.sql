DECLARE @LinkEntityName varchar(2000)
DECLARE @EntityName varchar(2000)
DECLARE @LeftLinkEntityName varchar(2000)
DECLARE @RightLinkEntityName varchar(2000)
DECLARE @LeftEntityName varchar(2000)
DECLARE @RightEntityName varchar(2000)

DECLARE @Id int 

DECLARE db_cursor CURSOR FOR 

SELECT Id, LinkEntityName, EntityName from EntityStructure 

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @Id, @LinkEntityName, @EntityName 

WHILE @@FETCH_STATUS = 0  
BEGIN  

	IF(ISNULL(@LinkEntityName, '') <> '')
	BEGIN
		select @LeftLinkEntityName = substring(@LinkEntityName, 0, CHARINDEX(':', @LinkEntityName))
		select @RightLinkEntityName = substring(@LinkEntityName, CHARINDEX(':', @LinkEntityName)+1, Len(@LinkEntityName) - CHARINDEX(':', @LinkEntityName)) 
		
		SET @LeftLinkEntityName = (Select case when UPPER(TRIM(@LeftLinkEntityName)) = 'A' THEN 'A'
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'B' THEN 'B'	
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'C' THEN 'C'
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'D' THEN 'D'
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'E' THEN 'E'
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'F' THEN 'F'
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'G' THEN 'G'
										WHEN UPPER(TRIM(@LeftLinkEntityName)) = 'H' THEN 'H'
										END AS RESULT)

	update EntityStructure set UpdatedDate = getdate(), LinkEntityName = CONCAT(@LeftLinkEntityName, ':', @RightLinkEntityName) where Id = @Id
	END

	IF(ISNULL(@EntityName, '') <> '')
	BEGIN
		select @LeftEntityName = substring(@EntityName, 0, CHARINDEX(':', @EntityName))
		select @RightEntityName = substring(@EntityName, CHARINDEX(':', @EntityName)+1, Len(@EntityName) - CHARINDEX(':', @EntityName)) 

				SET @LeftEntityName = (Select case when UPPER(TRIM(@LeftEntityName)) = 'A' THEN 'A'
										WHEN UPPER(TRIM(@LeftEntityName)) = 'B' THEN 'B'	
										WHEN UPPER(TRIM(@LeftEntityName)) = 'C' THEN 'C'
										WHEN UPPER(TRIM(@LeftEntityName)) = 'D' THEN 'D'
										WHEN UPPER(TRIM(@LeftEntityName)) = 'E' THEN 'E'
										WHEN UPPER(TRIM(@LeftEntityName)) = 'F' THEN 'F'
										WHEN UPPER(TRIM(@LeftEntityName)) = 'G' THEN 'G'
										WHEN UPPER(TRIM(@LeftEntityName)) = 'H' THEN 'H'
										END AS RESULT)

		update EntityStructure set UpdatedDate = getdate(), EntityName = CONCAT(@LeftEntityName, ':', @RightEntityName) where Id = @Id
	END

    FETCH NEXT FROM db_cursor INTO @Id, @LinkEntityName, @EntityName  
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 
