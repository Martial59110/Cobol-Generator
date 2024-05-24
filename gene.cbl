       IDENTIFICATION DIVISION.
       PROGRAM-ID. CODE-GENERATOR.
       
        ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SEQFILE ASSIGN TO 'SEQFILE.cbl'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-STATUS.
           SELECT SQLFILE ASSIGN TO 'SQLFILE.cbl'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL.
               

       DATA DIVISION.
       FILE SECTION.
       FD  SEQFILE.
       01  OUTPUT-LINE PIC X(80).

       FD  SQLFILE.
       01  OUTPUT-LINE2 PIC X(80).
          
          
       WORKING-STORAGE SECTION.
       01  WS-STATUS         PIC XX.
           88  EndOfFile       VALUE '10'.
           88  NoErrors        VALUE '00'.
       01  Command-String          PIC X(100).
       
       01  WS-CHOICE PIC X.
       01  WS-CHOICE2 PIC X.
       01  WS-CHOICE3 PIC X.
       01  WS-CHOICE4 PIC X.
      

       01  COUNTER PIC 9 VALUE 0.
      
       SCREEN SECTION.

       01  START-SCREEN FOREGROUND-COLOR 3.
           
           05 FILLER PIC X(24) VALUE "GENERATOR SYSTEM"
           line 2 col 35  BLANK SCREEN.
           05 FILLER PIC X(60) VALUE 
           "1. Sequential file"
           line 8 col 35 FOREGROUND-COLOR 9.
           05 FILLER PIC X(60) VALUE 
           "2. Database" line 9 col 35  
           FOREGROUND-COLOR 9.

           05 FILLER PIC X(60) VALUE 
           "3. Subroutine" line 10 col 35  
           FOREGROUND-COLOR 9.
          
           05 FILLER PIC X(60) VALUE 
           "4. Copybook" line 11 col 35  
           FOREGROUND-COLOR 9.
        
           05 FILLER PIC X(60) VALUE 
           "5. Procedure" line 12 col 35  
           FOREGROUND-COLOR 9.
          
           05 LINE 15 COL 35 PIC X TO WS-CHOICE.
           
           05 line 20 col 35 AUTO PIC X(30) VALUE 
           "Exit (Y)".
          

       01  READ-SCREEN FOREGROUND-COLOR 9.
           05 FILLER PIC X(60) VALUE
            'Generate a sequential file...'
           line 3 col 35 FOREGROUND-COLOR 3 BLANK SCREEN.
           05 FILLER PIC X(23) VALUE "Read file (O/N) :"  
           line 5 col 35.
           05 AUTO LINE 5 COL 59 PIC X TO WS-CHOICE.
           05 FILLER PIC X(25) VALUE "Write file (O/N) :"  
           line 6 col 35.
           05 AUTO LINE 6 COL 61 PIC X TO WS-CHOICE2.
           05 FILLER PIC X(24) VALUE "Sort file (O/N) :"
           line 7 col 35.
           05 AUTO LINE 7 COL 60 PIC X TO WS-CHOICE3.
           05 FILLER PIC X(28) VALUE "Merge files (O/N) :"
           line 8 col 35.
           05 AUTO LINE 8 COL 64 PIC X TO WS-CHOICE4.
           05 line 20 col 35 FOREGROUND-COLOR 3 AUTO PIC X(30) VALUE 
           "Exit (Y)".
          
       01  SQL-SCREEN FOREGROUND-COLOR 9.
           05 FILLER PIC X(60) VALUE
            'Generate a database file...'
           line 3 col 35 FOREGROUND-COLOR 3 BLANK SCREEN.
           05 FILLER PIC X(49) VALUE "Access a designated database (O/N)
      -    " :"  
           line 5 col 35.
           05 AUTO LINE 5 COL 73 PIC X TO WS-CHOICE.
           05 FILLER PIC X(29) VALUE "SELECT COUNT(*) query (O/N) :"  
           line 6 col 35.
           05 AUTO LINE 6 COL 65 PIC X TO WS-CHOICE2.
           05 FILLER PIC X(14) VALUE "Cursor (O/N) :"
           line 7 col 35.
           05 AUTO LINE 7 COL 50 PIC X TO WS-CHOICE3.
           05 FILLER PIC X(20) VALUE "UPDATE query (O/N) :"
           line 8 col 35.
           05 AUTO LINE 8 COL 56 PIC X TO WS-CHOICE4.
           05 line 20 col 35 FOREGROUND-COLOR 3 AUTO PIC X(30) VALUE 
           "Exit (Y)".

       PROCEDURE DIVISION.
       MAIN-PROGRAM.
          
         
           PERFORM UNTIL WS-CHOICE = 'Y'
               
               ACCEPT START-SCREEN
               MOVE FUNCTION UPPER-CASE(WS-CHOICE) TO WS-CHOICE
              

               EVALUATE WS-CHOICE
                   WHEN "1"
                       PERFORM 1000-SEQUENTIAL-FILE
                   WHEN "2"
                       PERFORM 2000-SQL
                   WHEN "Y"
                   STOP RUN
                   WHEN OTHER
                       DISPLAY 'Invalid choice, please try again.'
               END-EVALUATE
                 
           END-PERFORM.
           


         1000-SEQUENTIAL-FILE.
         
      
           ACCEPT READ-SCREEN.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE) TO WS-CHOICE.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE2) TO WS-CHOICE2.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE3) TO WS-CHOICE3.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE4) TO WS-CHOICE4.
           

           OPEN OUTPUT SEQFILE.
          
           COPY 'read.cpy'.
                             
           CLOSE SEQFILE.

       2000-SQL.
           
           ACCEPT SQL-SCREEN.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE) TO WS-CHOICE.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE2) TO WS-CHOICE2.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE3) TO WS-CHOICE3.
           MOVE FUNCTION UPPER-CASE(WS-CHOICE4) TO WS-CHOICE4.
        
           OPEN OUTPUT SQLFILE.

           COPY 'sql.cpy'.

           CLOSE SQLFILE.

