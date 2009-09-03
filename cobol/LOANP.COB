      ******************************************************************
      *                                                                *
      *            C O M P U T E   L O A N   P A Y M E N T             *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    USAGE:  MOVE <LOAN AMOUNT>     TO LW-LOAN-AMT.              *
      *            MOVE <ANNUAL INT %>    TO LW-INT-RATE.              *
      *            MOVE <NUMBER PAYMENTS> TO LW-NBR-PMTS.              *
      *            PERFORM 004000-COMPUTE-PAYMENT                      *
      *               THRU 004000-EXIT.                                *
      *                                                                *
      *    RESULT: LW-LOAN-ERROR-FLAG = 0 IF CALC SUCCESSFUL           *
      *            LW-LOAN-ERROR-FLAG = 1 IF CALC NOT SUCCESSFUL       *
      *                                                                *
      *       IF LW-LOAN-ERROR-FLAG = 0                                *
      *                                                                *
      *            LW-PMT-AMT    = AMOUNT OF MONTHLY PAYMENT           *
      *            LW-TOTAL-PMTS = TOTAL AMOUNT OF PAYMENTS            *
      *            LW-TOTAL-INT  = TOTAL AMOUNT OF INTEREST            *
      *                                                                *
      ******************************************************************
      *
        004000-COMPUTE-PAYMENT.
      *
           MOVE 0 TO LW-LOAN-ERROR-FLAG.
      *
           IF (LW-LOAN-AMT ZERO)
               OR
              (LW-INT-RATE ZERO)
               OR
              (LW-NBR-PMTS ZERO)
               MOVE 1 TO LW-LOAN-ERROR-FLAG
               GO TO 004000-EXIT.
      *
           COMPUTE LW-INT-PMT = LW-INT-RATE / 1200
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004000-EXIT.
      *
           COMPUTE LW-PMT-AMT ROUNDED =
               (LW-LOAN-AMT * LW-INT-PMT) /
               (1 - 1.00000000 / ( (1 + LW-INT-PMT) ** LW-NBR-PMTS) )
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004000-EXIT.
      *
           COMPUTE LW-TOTAL-PMTS = LW-PMT-AMT * LW-NBR-PMTS
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004000-EXIT.
      *
           COMPUTE LW-TOTAL-INT = LW-TOTAL-PMTS - LW-LOAN-AMT.
      *
        004000-EXIT.
           EXIT.
      *
      *
      *
      ******************************************************************
      *                                                                *
      *             C O M P U T E   L O A N   A M O U N T              *
      *                                                                *
      *                      Judson D. McClendon                       *
      *                      Sun Valley Systems                        *
      *                      329 37th Court NE                         *
      *                      Birmingham, AL 35215                      *
      *                         205/853-8440                           *
      *                                                                *
      *    USAGE:  MOVE <MONTHLY PAYMENT> TO LW-LOAN-AMT.              *
      *            MOVE <ANNUAL INT %>    TO LW-INT-RATE.              *
      *            MOVE <NUMBER PAYMENTS> TO LW-NBR-PMTS.              *
      *            PERFORM 004100-COMPUTE-LOAN                         *
      *               THRU 004100-EXIT.                                *
      *                                                                *
      *    RESULT: LW-LOAN-ERROR-FLAG = 0 IF CALC SUCCESSFUL           *
      *            LW-LOAN-ERROR-FLAG = 1 IF CALC NOT SUCCESSFUL       *
      *                                                                *
      *       IF LW-LOAN-ERROR-FLAG = 0                                *
      *                                                                *
      *            LW-LOAN-AMT   = AMOUNT OF LOAN                      *
      *            LW-TOTAL-PMTS = TOTAL AMOUNT OF PAYMENTS            *
      *            LW-TOTAL-INT  = TOTAL AMOUNT OF INTEREST            *
      *                                                                *
      ******************************************************************
      *
        004100-COMPUTE-LOAN.
      *
           MOVE 0 TO LW-LOAN-ERROR-FLAG.
      *
           IF (LW-PMT-AMT ZERO)
               OR
              (LW-INT-RATE ZERO)
               OR
              (LW-NBR-PMTS ZERO)
               MOVE 1 TO LW-LOAN-ERROR-FLAG
               GO TO 004100-EXIT.
      *
           COMPUTE LW-INT-PMT = LW-INT-RATE / 1200
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004100-EXIT.
      *
           COMPUTE LW-LOAN-AMT = LW-PMT-AMT *
               ( (1 - 1.00000000 / ( (1 + LW-INT-PMT) ** LW-NBR-PMTS) )
                       / LW-INT-PMT)
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004100-EXIT.
           COMPUTE LW-TOTAL-PMTS = LW-PMT-AMT * LW-NBR-PMTS
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004100-EXIT.
           COMPUTE LW-TOTAL-INT = LW-TOTAL-PMTS - LW-LOAN-AMT.
      *
           COMPUTE LW-TOTAL-PMTS = LW-PMT-AMT * LW-NBR-PMTS
               ON SIZE ERROR
                   MOVE 1 TO LW-LOAN-ERROR-FLAG
                   GO TO 004100-EXIT.
      *
           COMPUTE LW-TOTAL-INT = LW-TOTAL-PMTS - LW-LOAN-AMT.
      *
        004100-EXIT.
           EXIT.
