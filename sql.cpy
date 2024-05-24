
           MOVE "       IDENTIFICATION DIVISION." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "       PROGRAM-ID. SQLPROG." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
      
          
           MOVE "       DATA DIVISION." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2.
           MOVE "       WORKING-STORAGE SECTION." TO OUTPUT-LINE2.
           WRITE OUTPUT-LINE2.

           IF WS-CHOICE2 = "O"
           MOVE "       01  DK-COUNT PIC 9(10) VALUE ZEROS." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           END-IF.

           IF WS-CHOICE3 = "O"
           MOVE "       01  DK-TABLE." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           05  DK-ENTRY OCCURS 100 TIMES." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           10  DK-COLUMN1 PIC X(20)." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           10  DK-COLUMN2 PIC X(20)." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "       01  WS-IDX PIC 99." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           END-IF.

           IF WS-CHOICE = "O"
           MOVE "        EXEC SQL BEGIN DECLARE SECTION END-EXEC." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "       01  DBNAME PIC X(20) VALUE 'database'." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "       01  USERNAME  PIC X(20) VALUE 'username'." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "       01  PASSWD PIC X(10) VALUE SPACE." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           
           MOVE "        EXEC SQL END DECLARE SECTION END-EXEC." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "        EXEC SQL INCLUDE SQLCA END-EXEC." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           END-IF.

           MOVE "       PROCEDURE DIVISION." TO OUTPUT-LINE2.
           WRITE OUTPUT-LINE2.

           IF WS-CHOICE = "O"
           MOVE "       1000-ACCESS-DATABASE." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           DISPLAY 'Accessing database...'." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           EXEC SQL" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               CONNECT :USERNAME IDENTIFIED BY :PASSWD 
      -    "USING :DBNAME"
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-EXEC." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           IF SQLCODE EQUAL ZERO" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DISPLAY 'Database connection successful
      -    "'" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           ELSE" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DISPLAY 'Database connection failed'" 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-IF." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           INITIALIZE SQLCODE." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           END-IF.

            IF WS-CHOICE2 = "O"
          
           MOVE "       2000-GENERATE-SELECT-COUNT." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           DISPLAY 'Generating SELECT COUNT(*) query...
      -    "'." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           EXEC SQL" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               SELECT COUNT(*)" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               INTO :DK-COUNT" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               FROM my_table" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-EXEC." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           IF SQLCODE EQUAL ZERO" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DISPLAY 'Query executed successfully. 
      -    "Count is: '" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DK-COUNT" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           ELSE" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DISPLAY 'Query execution failed.'" 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-IF." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           INITIALIZE SQLCODE." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           END-IF.

           IF WS-CHOICE3 = "O"
           
           MOVE "       3000-GENERATE-FETCH." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           DISPLAY 'Generating cursor...'." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           EXEC SQL" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DECLARE my_cursor CURSOR FOR"
            TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               SELECT column1, column2" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               FROM my_table" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-EXEC." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           IF SQLCODE EQUAL ZERO" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "              DISPLAY 'Cursor declared successfully.'" 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           ELSE" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               DISPLAY 'Cursor declaration failed.'" 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-IF." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           EXEC SQL OPEN my_cursor END-EXEC."
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           PERFORM 3100-FETCH UNTIL SQLCODE NOT = 0"
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           
           MOVE "           EXEC SQL CLOSE my_cursor END-EXEC." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           INITIALIZE SQLCODE." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "       3100-FETCH." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           EXEC SQL" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           FETCH my_cursor INTO :DK-ENTRY"
      
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-EXEC." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2

           MOVE "           ADD 1 TO WS-IDX" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           DISPLAY 'Colonne 1: ', DK-COLUMN1(WS-IDX), ' 
      -    "Colonne 2: '," TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
      
           MOVE"            DK-COLUMN2(WS-IDX)." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2


            END-IF.

           IF WS-CHOICE4 = "O"
          
           MOVE "       4000-UPDATE-QUERY." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           DISPLAY 'Generating UPDATE query...'." 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           EXEC SQL" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               UPDATE my_table" TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               SET column1 = 'new_value'" 
           TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "               WHERE column2 = 'some_condition'"
            TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
           MOVE "           END-EXEC." TO OUTPUT-LINE2
           WRITE OUTPUT-LINE2
        
           END-IF.

