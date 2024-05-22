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
           MOVE 
           "           SELECT INPUT-FILE ASSIGN TO 'inputfile.txt'" 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           ORGANIZATION IS LINE SEQUENTIAL" 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "          FILE STATUS IS WS-STATUS." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       DATA DIVISION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       FILE SECTION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       FD  INPUT-FILE." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       01  INPUT-RECORD." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           05  INPUT-DATA    PIC X(80)." 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       WORKING-STORAGE SECTION." 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       01  WS-STATUS         PIC XX." 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           88  EndOfFile       VALUE '10'." 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           88  NoErrors        VALUE '00'." 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       PROCEDURE DIVISION." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "       MAIN-PROCEDURE." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           OPEN INPUT INPUT-FILE." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           
           MOVE "               READ INPUT-FILE." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           PERFORM UNTIL WS-STATUS NOT EQUAL TO '00' " 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           DISPLAY INPUT-DATA " 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           END-PERFORM. " 
           TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "               CLOSE INPUT-FILE." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.
           MOVE "           STOP RUN." TO OUTPUT-LINE.
           WRITE OUTPUT-LINE.