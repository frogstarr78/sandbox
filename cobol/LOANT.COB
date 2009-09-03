        IDENTIFICATION DIVISION.
      *
        PROGRAM-ID.    LOANT.
      *
        DATE-WRITTEN.  04/16/84.
      *
      *    MODIFIED   10/18/97.
      *
      *        *******************************
      *        *                             *
      *        *     Judson D. McClendon     *
      *        *     Sun Valley Systems      *
      *        *     329 37th Court N.E.     *
      *        *     Birmingham, AL 35215    *
      *        *        205-853-8440         *
      *        *                             *
      *        *******************************
      *
        ENVIRONMENT DIVISION.
      *
        CONFIGURATION SECTION.
      *
        INPUT-OUTPUT SECTION.
      *
        FILE-CONTROL.
      *
        I-O-CONTROL.
      *
        DATA DIVISION.
      *
        FILE SECTION.
      *
        WORKING-STORAGE SECTION.
      *
      *                     ALPHA 77'S
      *
        77  WS-ANSWER                   PIC  X(01) VALUE SPACE.
        77  WS-COMMAND                  PIC  X(01) VALUE SPACE.
        77  WS-ERR-MSG                  PIC  X(40) VALUE SPACES.
      *
      *                    NUMERIC 77'S
      *
        77  WS-ESCAPE-FLAG              PIC  9(01)       VALUE ZERO.
      *
        COPY "LOANW.COB".
      *
        SCREEN SECTION.
      *
      *
      *             C O M M A N D   S C R E E N
      *
        01  COMMAND-SCREEN.
           03  BLANK SCREEN.
           03  LINE 01  COLUMN 20  VALUE
               "L O A N   C O M P U T A T I O N".
           03  LINE 03  COLUMN 01  VALUE
               "Press: P=Compute Payment Amount,".
           03  LINE 04  COLUMN 08  VALUE
               "L=Compute Loan Amount,".
           03  LINE 05  COLUMN 05  VALUE
               "or ESCape to exit: ".
           03  PIC  X              TO WS-COMMAND  AUTO.
      *
      *
      *                L O A N   S C R E E N
      *
        01  LOAN-SCREEN.
           03  LINE 03  COLUMN 01  ERASE EOS.
           03  LINE 03  COLUMN 01  VALUE "Payment Amt:  ".
           03  PIC  ZZZZZ9.99      USING LW-PMT-AMT.
           03  LINE 04  COLUMN 01  VALUE "Interest Rate:    ".
           03  PIC  Z9.99          USING LW-INT-RATE.
           03  LINE 05  COLUMN 01  VALUE "Number Payments: ".
           03  PIC  ZZ9            USING LW-NBR-PMTS.
      *
      *
      *            L O A N   A N S W E R   S C R E E N
      *
        01  LOAN-ANSWER-SCREEN.
           03  LINE 07  COLUMN 01  VALUE "Loan Amount: ".
           03  PIC  ZZZ,ZZ9.99     FROM LW-LOAN-AMT.
           03  LINE 08  COLUMN 01  VALUE "Total Inter: ".
           03  PIC  ZZZ,ZZ9.99     FROM LW-TOTAL-INT.
           03  LINE 09  COLUMN 01  VALUE "Total Pmts:  ".
           03  PIC  ZZZ,ZZ9.99     FROM LW-TOTAL-PMTS.
      *
      *
      *             P A Y M E N T   S C R E E N
      *
        01  PAYMENT-SCREEN.
           03  LINE 03  COLUMN 01  ERASE EOS.
           03  LINE 03  COLUMN 01  VALUE "Loan Amount:  ".
           03  PIC  ZZZZZ9.99      USING LW-LOAN-AMT.
           03  LINE 04  COLUMN 01  VALUE "Interest Rate:    ".
           03  PIC  Z9.99          USING LW-INT-RATE.
           03  LINE 05  COLUMN 01  VALUE "Number Payments: ".
           03  PIC  ZZ9            USING LW-NBR-PMTS.
      *
      *
      *        P A Y M E N T   A N S W E R   S C R E E N
      *
        01  PAYMENT-ANSWER-SCREEN.
           03  LINE 07  COLUMN 01  VALUE "Payment Amt: ".
           03  PIC  ZZZ,ZZ9.99     FROM LW-PMT-AMT.
           03  LINE 08  COLUMN 01  VALUE "Total Inter: ".
           03  PIC  ZZZ,ZZ9.99     FROM LW-TOTAL-INT.
           03  LINE 09  COLUMN 01  VALUE "Total Pmts:  ".
           03  PIC  ZZZ,ZZ9.99     FROM LW-TOTAL-PMTS.
      *
      *
      *            E R R O R   S C R E E N
      *
        01  ERROR-SCREEN.
           03  LINE 24  COLUMN 20  HIGHLIGHT  BLANK LINE
               PIC  X(40)          FROM WS-ERR-MSG.
           03           COLUMN 70
               PIC  X              TO WS-ANSWER  AUTO.
      /
        PROCEDURE DIVISION.
      *
      *
      *                        C O N T R O L
      *
        000000-CONTROL.
      *
           INITIALIZE LOAN-WORK-AREA.
      *
           DISPLAY COMMAND-SCREEN.
      *
           PERFORM 000100-GET-COMMAND
              THRU 000100-EXIT
               UNTIL (WS-ESCAPE-FLAG = 1).
      *
        000000-EXIT.
           STOP RUN.
      *
      *
      *               G E T   C O M M A N D
      *
        000100-GET-COMMAND.
      *
           MOVE SPACE TO WS-COMMAND.
           ACCEPT COMMAND-SCREEN
               ON ESCAPE
                   MOVE 1 TO WS-ESCAPE-FLAG
                   GO TO 000100-EXIT.
           INSPECT WS-COMMAND
               CONVERTING "abcdefghijklmnopqrstuvwxyz"
                       TO "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
      *
           IF (WS-COMMAND = "P")
               DISPLAY PAYMENT-SCREEN
               PERFORM 000500-FIND-PAYMENT
                  THRU 000500-EXIT
           ELSE
           IF (WS-COMMAND = "L")
               DISPLAY LOAN-SCREEN
               PERFORM 000600-FIND-LOAN
                  THRU 000600-EXIT.
      *
           DISPLAY COMMAND-SCREEN.
      *
        000100-EXIT.
           EXIT.
      *
      *
      *                   F I N D   P A Y M E N T
      *
        000500-FIND-PAYMENT.
      *
           ACCEPT PAYMENT-SCREEN
               ON ESCAPE
                   GO TO 000500-EXIT.
      *
           PERFORM 004000-COMPUTE-PAYMENT
              THRU 004000-EXIT.
      *
           IF (LW-LOAN-ERROR-FLAG = 1)
               MOVE "PARAMETER ERROR" TO WS-ERR-MSG
               DISPLAY ERROR-SCREEN
               GO TO 000500-FIND-PAYMENT.
      *
           DISPLAY PAYMENT-ANSWER-SCREEN.
      *
           MOVE "PRESS A KEY TO CONTINUE" TO WS-ERR-MSG..
           DISPLAY ERROR-SCREEN.
           ACCEPT ERROR-SCREEN.
      *
        000500-EXIT.
           EXIT.
      *
      *
      *                   F I N D   L O A N
      *
        000600-FIND-LOAN.
      *
           ACCEPT LOAN-SCREEN
               ON ESCAPE
                   GO TO 000600-EXIT.
      *
           PERFORM 004100-COMPUTE-LOAN
              THRU 004100-EXIT.
      *
           IF (LW-LOAN-ERROR-FLAG = 1)
               MOVE "PARAMETER ERROR" TO WS-ERR-MSG
               DISPLAY ERROR-SCREEN
               GO TO 000600-FIND-LOAN.
      *
           DISPLAY LOAN-ANSWER-SCREEN.
      *
           MOVE "PRESS A KEY TO CONTINUE" TO WS-ERR-MSG..
           DISPLAY ERROR-SCREEN.
           ACCEPT ERROR-SCREEN.
      *
        000600-EXIT.
           EXIT.
        COPY "LOANP.COB".
