PAS2AF   TITLE 'ASSEMBLER FUNCTION CALLABLE FROM PASCAL'
*
**************************************************************
*        Pascal prototype =
*
*        function PAS_TO_ASM_FUNC ( X1 : INTEGER ;
*                                   X2 : INTEGER ) : INTEGER ;
*
*           EXTERNAL ASSEMBLER 'PAS2AF' ;
**************************************************************
*
PAS2AF   CSECT
         STM   R14,R12,12(R13)
         LR    R11,R15             LOAD BASE REGISTER
         USING PAS2AF,R11
         LA    R15,SAVEAREA
         ST    R15,8(R13)
         ST    R13,4(R15)
         LR    R13,R15
*
**************************************************************
*        fetch parameters
**************************************************************
*
         L     R2,0(R1)            = X1 (by value)
         L     R3,4(R1)            = X2 (by value)
*
**************************************************************
*        work on parameters
**************************************************************
*
         AR    R2,R3
         SRA   R2,1
         LR    R0,R2               function result in R0
*
**************************************************************
*        exit (return to caller)
**************************************************************
*
EXIT     DS    0H
         L     R13,4(R13)
         LM    R14,R15,12(R13)     restore regs
         LM    R1,R12,24(R13)      but omit R0 (function result)
         XR    R15,R15
         BR    R14
         EJECT
*
**************************************************************
*        definitions
**************************************************************
*
         DS    0D
SAVEAREA DS    18F
*
**************************************************************
*        REGISTER ASSIGNMENTS
**************************************************************
*
         REGEQU
*
         END
