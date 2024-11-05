-- Verificarea existenței constrângerii în tabela Tasks
PRINT 'Verificare constrângere DF_Tasks__state în Tasks';
IF EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    WHERE TABLE_NAME = 'Tasks' AND CONSTRAINT_NAME = 'DF_Tasks__state'
)
    PRINT 'Constrângerea DF_Tasks__state există în tabela Tasks.';
ELSE
    PRINT 'Constrângerea DF_Tasks__state NU există în tabela Tasks.';

-- Verificarea tipului de date al coloanei _state în tabela Tasks
PRINT 'Verificare tip de date pentru coloana _state în Tasks';
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = '_state';

-- Verificarea tipului de date al coloanei _state în tabela TaskUpdateRecords
PRINT 'Verificare tip de date pentru coloana _state în TaskUpdateRecords';
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'TaskUpdateRecords' AND COLUMN_NAME = '_state';

-- Verificarea tipului de date al coloanei _state în tabela ErrorLog
PRINT 'Verificare tip de date pentru coloana _state în ErrorLog';
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'ErrorLog' AND COLUMN_NAME = '_state';

-- Verificarea valorii implicite pentru coloana _state în tabela Tasks
PRINT 'Verificare valoare implicită pentru coloana _state în Tasks';
SELECT COLUMN_NAME, COLUMN_DEFAULT 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = '_state';