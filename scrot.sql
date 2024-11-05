-- Check for the existence of the constraint in the Tasks table
PRINT 'Checking for the constraint DF_Tasks__state in the Tasks table';
IF EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    WHERE TABLE_NAME = 'Tasks' AND CONSTRAINT_NAME = 'DF_Tasks__state'
)
    PRINT 'The constraint DF_Tasks__state exists in the Tasks table.';
ELSE
    PRINT 'The constraint DF_Tasks__state does NOT exist in the Tasks table.';

-- Check the data type of the _state column in the Tasks table
PRINT 'Checking data type for the _state column in the Tasks table';
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = '_state';

-- Check the data type of the _state column in the TaskUpdateRecords table
PRINT 'Checking data type for the _state column in the TaskUpdateRecords table';
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'TaskUpdateRecords' AND COLUMN_NAME = '_state';

-- Check the data type of the _state column in the ErrorLog table
PRINT 'Checking data type for the _state column in the ErrorLog table';
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'ErrorLog' AND COLUMN_NAME = '_state';

-- Check the default value for the _state column in the Tasks table
PRINT 'Checking the default value for the _state column in the Tasks table';
SELECT COLUMN_NAME, COLUMN_DEFAULT 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = '_state';

-- Check for the existence of the next_retry_date column in the Tasks table
PRINT 'Checking existence and data type for the next_retry_date column in the Tasks table';
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = 'next_retry_date';

-- Check for the existence of the retry_count column in the Tasks table
PRINT 'Checking existence and data type for the retry_count column in the Tasks table';
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Tasks' AND COLUMN_NAME = 'retry_count';