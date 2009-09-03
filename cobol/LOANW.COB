      ******************************************************************
      *                                                                *
      *                  L O A N   W O R K   A R E A                   *
      *                                                                *
      ******************************************************************
      *
        01  LOAN-WORK-AREA.
           03  LW-LOAN-ERROR-FLAG      PIC  9(01)       COMP.
           03  LW-LOAN-AMT             PIC  9(06)V9(02) COMP.
           03  LW-INT-RATE             PIC  9(02)V9(02) COMP.
           03  LW-NBR-PMTS             PIC  9(03)       COMP.
           03  LW-PMT-AMT              PIC  9(06)V9(02) COMP.
           03  LW-INT-PMT              PIC  9(01)V9(12) COMP.
           03  LW-TOTAL-PMTS           PIC  9(06)V9(02) COMP.
           03  LW-TOTAL-INT            PIC  9(06)V9(02) COMP.
