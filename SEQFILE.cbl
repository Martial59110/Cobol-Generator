       IDENTIFICATION DIVISION.
       PROGRAM-ID. READFILE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'inputfile.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-STATUS-INPUT.
           SELECT OUTPUT-FILE ASSIGN TO 'outputfile.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           FILE STATUS IS WS-STATUS-OUTPUT.
           SELECT SORT-WORKFILE ASSIGN TO 'sortfile.tmp'.

       DATA DIVISION.
       FILE SECTION.

       FD  INPUT-FILE.
       01  INPUT-RECORD.
           05  INPUT-DATA    PIC X(80).

       01  INPUT-EXAMPLES.
           05  RECORD1   PIC X(20).
           05  RECORD2   PIC X(20).
           05  RECORD3   PIC X(20).
           05  RECORD4   PIC X(20).

       FD  OUTPUT-FILE.
       01  OUTPUT-RECORD.
           05  OUTPUT-DATA    PIC X(80).

       SD  SORT-WORKFILE.
       01  SORT-RECORD.
          05  SORT-DATA    PIC X(80).

       WORKING-STORAGE SECTION.
       01  VAR-EXAMPLE         PIC X(20).
       01  WS-STATUS-INPUT         PIC XX.
           88  EndOfFile       VALUE '10'.
           88  NoErrors        VALUE '00'.
       01  WS-STATUS-OUTPUT  PIC XX.
           88  OutputNoErrors  VALUE '00'.
           88  OutputError     VALUE 'XX'.

       PROCEDURE DIVISION.
       3000-SORT-FILE.
                 SORT SORT-WORKFILE ON ASCENDING KEY SORT-DATA
                 INPUT PROCEDURE IS 3100-SORT-INPUT-PROCEDURE
                 OUTPUT PROCEDURE IS 3200-SORT-OUTPUT-PROCEDURE.

       3100-SORT-INPUT-PROCEDURE.
                 OPEN INPUT INPUT-FILE
                 IF WS-STATUS-INPUT NOT EQUAL TO NoErrors
               DISPLAY 'Error opening input file. Status:'
            WS-STATUS-INPUT
                 STOP RUN
                 END-IF.

                 PERFORM UNTIL EndOfFile
                 READ INPUT-FILE
                  AT END
                  SET EndOfFile TO TRUE
                  NOT AT END
                 MOVE INPUT-RECORD TO SORT-RECORD
                  RELEASE SORT-RECORD
                  END-READ
                  END-PERFORM
                 CLOSE INPUT-FILE.

       3200-SORT-OUTPUT-PROCEDURE.
               OPEN OUTPUT OUTPUT-FILE
            IF WS-STATUS-OUTPUT NOT EQUAL TO OutputNoErrors
               DISPLAY 'Error opening output file. Status:'
               WS-STATUS-OUTPUT
               STOP RUN
              END-IF.

               RETURN SORT-WORKFILE
               AT END
               EXIT
               NOT AT END
                MOVE SORT-RECORD TO OUTPUT-RECORD
               WRITE OUTPUT-RECORD
                IF WS-STATUS-OUTPUT NOT EQUAL TO OutputNoErrors
                DISPLAY 'Error writing to output file. Status: '
                WS-STATUS-OUTPUT
               STOP RUN
               END-IF
               END-RETURN
               CLOSE OUTPUT-FILE.
