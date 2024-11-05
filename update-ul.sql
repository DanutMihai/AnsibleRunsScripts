USE MOVIUS_GOLDENDATASOURCE;

-- Check if the column _state exists and its data type in TaskAPI.Tasks
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = '_state' AND DATA_TYPE = 'varchar' AND CHARACTER_MAXIMUM_LENGTH = 50
)
BEGIN
    PRINT 'Altering column _state in TaskAPI.Tasks';
    ALTER TABLE TaskAPI.Tasks ALTER COLUMN _state VARCHAR(50);
END
ELSE
BEGIN
    PRINT 'Column _state in TaskAPI.Tasks already exists with the correct data type.';
END

-- Check if the default constraint DF_Tasks__state exists in TaskAPI.Tasks
IF EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    WHERE TABLE_NAME = 'Tasks' AND CONSTRAINT_NAME = 'DF_Tasks__state'
)
BEGIN
    PRINT 'Dropping existing constraint DF_Tasks__state in TaskAPI.Tasks';
    ALTER TABLE TaskAPI.Tasks DROP CONSTRAINT DF_Tasks__state;
END

-- Add the default constraint for _state in TaskAPI.Tasks
PRINT 'Adding default constraint DF_Tasks__state in TaskAPI.Tasks';
ALTER TABLE TaskAPI.Tasks ADD CONSTRAINT DF_Tasks__state DEFAULT 'new' FOR _state;

-- Check if the column _state exists and its data type in TaskAPI.TaskUpdateRecords
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'TaskUpdateRecords' AND COLUMN_NAME = '_state' AND DATA_TYPE = 'varchar' AND CHARACTER_MAXIMUM_LENGTH = 50
)
BEGIN
    PRINT 'Altering column _state in TaskAPI.TaskUpdateRecords';
    ALTER TABLE TaskAPI.TaskUpdateRecords ALTER COLUMN _state VARCHAR(50);
END
ELSE
BEGIN
    PRINT 'Column _state in TaskAPI.TaskUpdateRecords already exists with the correct data type.';
END

-- Check if the column _state exists and its data type in TaskAPI.ErrorLog
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'ErrorLog' AND COLUMN_NAME = '_state' AND DATA_TYPE = 'varchar' AND CHARACTER_MAXIMUM_LENGTH = 50
)
BEGIN
    PRINT 'Altering column _state in TaskAPI.ErrorLog';
    ALTER TABLE TaskAPI.ErrorLog ALTER COLUMN _state VARCHAR(50);
END
ELSE
BEGIN
    PRINT 'Column _state in TaskAPI.ErrorLog already exists with the correct data type.';
END

-- Check if the column next_retry_date exists in TaskAPI.Tasks
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = 'next_retry_date'
)
BEGIN
    PRINT 'Adding column next_retry_date in TaskAPI.Tasks';
    ALTER TABLE TaskAPI.Tasks ADD next_retry_date DATETIME2(3) NULL;
END
ELSE
BEGIN
    PRINT 'Column next_retry_date in TaskAPI.Tasks already exists.';
END

-- Check if the column retry_count exists in TaskAPI.Tasks
IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = 'retry_count'
)
BEGIN
    PRINT 'Adding column retry_count in TaskAPI.Tasks';
    ALTER TABLE TaskAPI.Tasks ADD retry_count INT NULL;
END
ELSE
BEGIN
    PRINT 'Column retry_count in TaskAPI.Tasks already exists.';
END