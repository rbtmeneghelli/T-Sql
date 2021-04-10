-- Criar uma chave mestra para a criptografia
CREATE MASTER KEY ENCRYPTION BY   
PASSWORD = '23987hxJKL969#ghf0%94467GRkjg5k3fd117r$$#1946kcj$n44nhdlj';  

-- Alterar a criptografia da chave mestra criada
OPEN MASTER KEY DECRYPTION BY PASSWORD = '23987hxJKL969#ghf0%94467GRkjg5k3fd117r$$#1946kcj$n44nhdlj'; -- password used to protect DMK
ALTER MASTER KEY REGENERATE WITH ENCRYPTION BY PASSWORD = '23987hxJKL969#ghf0%94467GRkjg5k3fd117r$$#1946kcj$n44nhdlj';
CLOSE MASTER KEY;

-- Tabela responsavel por visualizar a chave gerada acima
SELECT * FROM sys.symmetric_keys

-- Criar certificado que ira utilizar a senha criptografia da master key
CREATE CERTIFICATE PswProtect
   WITH SUBJECT = 'Password Protection';
GO

-- Tabela responsavel por retornar o certificado
SELECT name CertName, 
    certificate_id CertID, 
    pvt_key_encryption_type_desc EncryptType, 
    issuer_name Issuer
FROM sys.certificates;

CREATE SYMMETRIC KEY SSN_Key_01
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE PswProtect;
GO

-- Tabela responsavel por retornar a simetrica gerada para o certificado
SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

--------------------------------------------------------------------------------------------------------------------------

-- Testando a criptografia
CREATE TABLE TEST(
FIELD varbinary(MAX))

-- Inserindo dado criptografado no campo field e na tabela TEST
OPEN SYMMETRIC KEY SSN_Key_01 DECRYPTION BY CERTIFICATE PswProtect;
insert into TEST(FIELD) values (EncryptByKey (Key_GUID('SSN_Key_01'), '123456'))
CLOSE SYMMETRIC KEY SSN_Key_01;

-- Quebrando a criptografia e retornando o valor real
OPEN SYMMETRIC KEY SSN_Key_01 DECRYPTION BY CERTIFICATE PswProtect;
SELECT FIELD AS 'Encrypted data',
            CONVERT(varchar, DecryptByKey(FIELD)) AS 'Decrypted Bank account number'
            FROM TEST;
CLOSE SYMMETRIC KEY SSN_Key_01;

