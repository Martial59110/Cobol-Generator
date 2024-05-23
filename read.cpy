           MOVE "       IDENTIFICATION DIVISION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       PROGRAM-ID. READFILE." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       ENVIRONMENT DIVISION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       INPUT-OUTPUT SECTION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       FILE-CONTROL." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.


              IF WS-CHOICE EQUAL "O" OR WS-CHOICE3 EQUAL "O"

           MOVE 
           "           SELECT INPUT-FILE ASSIGN TO 'inputfile.txt'" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           ORGANIZATION IS LINE SEQUENTIAL" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           FILE STATUS IS WS-STATUS-INPUT."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

              END-IF.


               IF WS-CHOICE2 EQUAL "O" OR WS-CHOICE3 EQUAL "O"

           MOVE 
           "           SELECT OUTPUT-FILE ASSIGN TO 'outputfile.txt'" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           ORGANIZATION IS LINE SEQUENTIAL" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           FILE STATUS IS WS-STATUS-OUTPUT."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

              END-IF.



              IF WS-CHOICE3 EQUAL "O"

           MOVE 
           "           SELECT SORT-WORKFILE ASSIGN TO 'sortfile.tmp'."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

              END-IF.

           WRITE OUTPUT-LINE FROM SPACE.
           MOVE "       DATA DIVISION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       FILE SECTION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           WRITE OUTPUT-LINE FROM SPACE.

           IF WS-CHOICE EQUAL "O" OR WS-CHOICE3 EQUAL "O"

           MOVE "       FD  INPUT-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "       01  INPUT-RECORD." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           05  INPUT-DATA    PIC X(80)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE
           MOVE "       01  INPUT-EXAMPLES." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           05  RECORD1   PIC X(20)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           05  RECORD2   PIC X(20)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           05  RECORD3   PIC X(20)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           05  RECORD4   PIC X(20)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE
           END-IF.



           IF WS-CHOICE2 EQUAL "O" OR WS-CHOICE3 EQUAL "O"

           MOVE "       FD  OUTPUT-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "       01  OUTPUT-RECORD." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           05  OUTPUT-DATA    PIC X(80)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE
           END-IF.


           IF WS-CHOICE3 EQUAL "O"

           MOVE "       SD  SORT-WORKFILE."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "       01  SORT-RECORD."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "          05  SORT-DATA    PIC X(80)."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

           END-IF.


           WRITE OUTPUT-LINE FROM SPACE.
           MOVE "       WORKING-STORAGE SECTION." 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.

           MOVE "       01  VAR-EXAMPLE         PIC X(20)." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

           IF WS-CHOICE EQUAL "O" OR WS-CHOICE3 EQUAL "O"

           MOVE "       01  WS-STATUS-INPUT         PIC XX." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           88  EndOfFile       VALUE '10'." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           88  NoErrors        VALUE '00'." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

           END-IF.

           IF WS-CHOICE2 EQUAL "O" OR WS-CHOICE3 EQUAL "O"

           MOVE "       01  WS-STATUS-OUTPUT  PIC XX." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           88  OutputNoErrors  VALUE '00'." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           88  OutputError     VALUE 'XX'." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

           END-IF.
           WRITE OUTPUT-LINE FROM SPACE.
           MOVE "       PROCEDURE DIVISION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           


           IF WS-CHOICE EQUAL "O"

           MOVE "       1000-READ-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           OPEN INPUT INPUT-FILE" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           IF WS-STATUS-INPUT NOT EQUAL TO NoErrors" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           DISPLAY 'Error opening input file. Status: ' 
      -    "WS-STATUS-INPUT"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           STOP RUN" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           END-IF" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE 

           MOVE "           PERFORM UNTIL EndOfFile" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           READ INPUT-FILE" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           AT END" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           SET EndOfFile TO TRUE" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           NOT AT END" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           DISPLAY INPUT-DATA" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           END-READ" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           END-PERFORM" TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           CLOSE INPUT-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE

           END-IF.

          
           
           IF WS-CHOICE2 EQUAL "O"
           
           MOVE "       2000-WRITE-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           OPEN OUTPUT OUTPUT-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           IF WS-STATUS-OUTPUT NOT EQUAL TO OutputNoErr
      -    "ors" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           DISPLAY 'Error opening output file. Status:' 
      -    "WS-STATUS-OUTPUT"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
            MOVE "           STOP RUN" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "           END-IF." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE

           MOVE "            PERFORM UNTIL WS-STATUS-OUTPUT EQUAL
      -    " OutputError " 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE

           IF WS-CHOICE2 = "O" AND WS-CHOICE NOT EQUAL TO "O"
           MOVE "            WRITE OUTPUT-DATA FROM VAR-EXAMPLE" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           END-IF

           IF WS-CHOICE2 = "O" AND WS-CHOICE = "O"
           MOVE "            WRITE OUTPUT-DATA FROM INPUT-DATA" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           END-IF

           MOVE "            END-PERFORM." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE "            CLOSE OUTPUT-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           WRITE OUTPUT-LINE FROM SPACE

           END-IF.

           IF WS-CHOICE3 EQUAL "O"

           MOVE "       3000-SORT-FILE." TO OUTPUT-LINE
           WRITE OUTPUT-LINE
           MOVE
           "                 SORT SORT-WORKFILE ON ASCENDING KEY SORT-DA
      -    "TA" TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 INPUT PROCEDURE IS 3100-SORT-INPUT-PROCEDUR
      -    "E"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 OUTPUT PROCEDURE IS 3200-SORT-OUTPUT-PROCED
      -    "URE."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           WRITE OUTPUT-LINE FROM SPACE

           MOVE
           "       3100-SORT-INPUT-PROCEDURE."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 OPEN INPUT INPUT-FILE"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 IF WS-STATUS-INPUT NOT EQUAL TO NoErrors"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "               DISPLAY 'Error opening input file. Status:'"
     
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE "            WS-STATUS-INPUT"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 STOP RUN"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 END-IF."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           WRITE OUTPUT-LINE FROM SPACE

    
           MOVE
           "                 PERFORM UNTIL EndOfFile"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "                 READ INPUT-FILE"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                  AT END"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                  SET EndOfFile TO TRUE"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                  NOT AT END"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 MOVE INPUT-RECORD TO SORT-RECORD"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                  RELEASE SORT-RECORD"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                  END-READ"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                  END-PERFORM"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                 CLOSE INPUT-FILE."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           WRITE OUTPUT-LINE FROM SPACE

            MOVE
           "       3200-SORT-OUTPUT-PROCEDURE."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               OPEN OUTPUT OUTPUT-FILE" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "            IF WS-STATUS-OUTPUT NOT EQUAL TO OutputNoErrors"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               DISPLAY 'Error opening output file. Status:'" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "               WS-STATUS-OUTPUT"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               STOP RUN" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "              END-IF."
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           WRITE OUTPUT-LINE FROM SPACE
            MOVE
           "               RETURN SORT-WORKFILE" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "               AT END"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               EXIT" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               NOT AT END" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                MOVE SORT-RECORD TO OUTPUT-RECORD"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               WRITE OUTPUT-RECORD" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "                IF WS-STATUS-OUTPUT NOT EQUAL TO OutputNoErr
      -    "ors" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "                DISPLAY 'Error writing to output file. Statu
      -    "s: '" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE "                WS-STATUS-OUTPUT"
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
            MOVE
           "               STOP RUN" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "               END-IF" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "               END-RETURN" 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 
           MOVE
           "               CLOSE OUTPUT-FILE." 
           TO OUTPUT-LINE
           WRITE OUTPUT-LINE 


           END-IF.