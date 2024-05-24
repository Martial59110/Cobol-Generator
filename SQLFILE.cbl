       IDENTIFICATION DIVISION.
       PROGRAM-ID. SQLPROG.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  DK-COUNT PIC 9(10) VALUE ZEROS.
       01  DK-TABLE.
           05  DK-ENTRY OCCURS 100 TIMES.
           10  DK-COLUMN1 PIC X(20).
           10  DK-COLUMN2 PIC X(20).
       01  WS-IDX PIC 99.
        EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME PIC X(20) VALUE 'database'.
       01  USERNAME  PIC X(20) VALUE 'username'.
       01  PASSWD PIC X(10) VALUE SPACE.
        EXEC SQL END DECLARE SECTION END-EXEC.
        EXEC SQL INCLUDE SQLCA END-EXEC.
       PROCEDURE DIVISION.
       1000-ACCESS-DATABASE.
           DISPLAY 'Accessing database...'.
           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.
           IF SQLCODE EQUAL ZERO
               DISPLAY 'Database connection successful '
           ELSE
               DISPLAY 'Database connection failed'
           END-IF.
           INITIALIZE SQLCODE.
       2000-GENERATE-SELECT-COUNT.
           DISPLAY 'Generating SELECT COUNT(*) query...'.
           EXEC SQL
               SELECT COUNT(*)
               INTO :DK-COUNT
               FROM my_table
           END-EXEC.
           IF SQLCODE EQUAL ZERO
               DISPLAY 'Query executed successfully.   Count is: '
               DK-COUNT
           ELSE
               DISPLAY 'Query execution failed.'
           END-IF.
           INITIALIZE SQLCODE.
       3000-GENERATE-FETCH.
           DISPLAY 'Generating cursor...'.
           EXEC SQL
               DECLARE my_cursor CURSOR FOR
               SELECT column1, column2
               FROM my_table
           END-EXEC.
           IF SQLCODE EQUAL ZERO
              DISPLAY 'Cursor declared successfully.'
           ELSE
               DISPLAY 'Cursor declaration failed.'
           END-IF.
           EXEC SQL OPEN my_cursor END-EXEC.
           PERFORM 3100-FETCH UNTIL SQLCODE NOT = 0
           EXEC SQL CLOSE my_cursor END-EXEC.
           INITIALIZE SQLCODE.
       3100-FETCH.
           EXEC SQL
           FETCH my_cursor INTO :DK-ENTRY
           END-EXEC.
           ADD 1 TO WS-IDX
           DISPLAY 'Colonne 1: ', DK-COLUMN1(WS-IDX), 'Colonne 2: ',
            DK-COLUMN2(WS-IDX).
       4000-UPDATE-QUERY.
           DISPLAY 'Generating UPDATE query...'.
           EXEC SQL
               UPDATE my_table
               SET column1 = 'new_value'
               WHERE column2 = 'some_condition'
           END-EXEC.
