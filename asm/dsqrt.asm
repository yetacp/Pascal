LSQR   TITLE   'SQUARE ROOT FUNCTION (LONG)'                            
         PRINT NOGEN                                                    
         DISK                                                           
         PRINT GEN                                                      
         SPACE 2                                                        
DSQRT#   CSECT                                                          
*                                                                       
*        SQUARE ROOT FUNCTION (LONG)                                      
*              1. WRITE X = M*16**(2P+Q), M MANTISSA, Q = 0 OR 1.       
*              2. THEN SQRT(X) = SQRT(M*16**-Q)*16**(P+Q).              
*                   P+Q IS THE EXPONENT OF THE ANSWER.                  
         SPACE                                                            
         ENTRY   DSQRT                                                    
         ENTRY     SQRT                                                 
         SPACE                                                            
GRA      EQU     1               ARGUMENT POINTER                       
GRS      EQU     13              SAVE AREA POINTER                      
GRR      EQU     14              RETURN REGISTER                          
GRL      EQU     15              LINK REGISTER                            
GR0      EQU     0               SCRATCH REGISTERS                        
GR1      EQU     1                                                        
GR2      EQU     14                                                       
FR0      EQU     0               ANSWER REGISTER                          
FR2      EQU     2               SCRATCH REGISTERS                        
FR4      EQU     4                                                        
         SPACE                                                            
SQRT     CALLDUBL  DSQRT,1                                              
         SPACE     1                                                    
DSQRT    FENTZ                                                          
         SPACE                                                            
LSQRT    STM     GRR,GRL,12(GRS) SAVE REGISTERS                           
         CHCKA     0(GRA),REAL8                                         
         L       GR2,0(GRA)                                               
         CHCKL     4(GRA),REAL8                                         
         CHCKDEF   REAL8,0(GR2)                                         
BEGIN    LD      FR0,0(GR2)      OBTAIN ARGUMENT                          
         LTDR    FR4,FR0                                                  
         BC      4,ERROR         IF NEGATIVE ARG, ERROR                   
         BC      8,EXIT          IF ARG IS 0, ANSWER IS 0. RETURN         
         STE     FR4,BUFF                                                 
         SPACE                                                            
         L       GR0,BUFF     COMPUTE TARGET CHARACTERISTIC - 8        
         AL      GR0,BIAS      = X'31000000' CHAR OF X'41' MINUS 2*8  
         SRDL    GR0,25            LOW GR0 = X'40'+P+Q-8                  
         STC     GR0,BUFF        GIVE THIS CHARACTERISTIC TO M AND B      
         STC     GR0,B             THIS SEEMINGLY ARTIFICIAL CHAR WAS     
         LE      FR2,BUFF            CHOSEN TO AID THE FINAL ROUNDING     
         AE      FR2,B           (M+B)*16**(P+Q-8)                        
         ME      FR2,A           A*(M+B)*16**(P+Q), A IS SCALED BY 8      
         LTR     GR1,GR1                                                  
         BC      10,*+8          IF Q=1, 1ST APPROX. Y0 IS READY          
         AER     FR2,FR2         IF Q=0, MULTIPLY BY 4 TO OBTAIN Y0       
         AER     FR2,FR2                                                  
         SPACE                                                            
         DER     FR4,FR2         NEWTON-RAPHSON ITERATIONS                
         AUR     FR4,FR2                                                  
         HER     FR4,FR4         Y1 = (Y0+ARG/Y0)/2  IN SHORT PRECISION   
         LER     FR2,FR0                                                  
         DER     FR2,FR4                                                  
         AUR     FR2,FR4                                                  
         HER     FR2,FR2         Y2 = (Y1+ARG/Y1)/2  IN SHORT PRECISION   
         LDR     FR4,FR0                                                  
         DDR     FR4,FR2                                                  
         AWR     FR4,FR2                                                  
         HDR     FR4,FR4         Y3 = (Y2+ARG/Y2)/2  IN LONG PRECISION    
         SPACE                                                            
         DDR     FR0,FR4         Y4 = (ARG/Y3-Y3)/2-D+D+Y3 FOR ROUNDING   
         SDR     FR0,FR4           1ST APPOXROX IS SO CHOSEN THAT         
         HER     FR0,FR0             ARG/Y3-Y3 IS LESS THAN 16**(P+Q-8)   
         SU      FR0,B                 HENCE 'HER' IS GOOD ENOUGH         
         AU      FR0,B             -D+D IS TO CHOP OFF EXCESS DIGITS OF   
         ADR     FR0,FR4             NEGATIVE VALUE (ARG/Y3-Y3)/2         
         SPACE                                                            
EXIT     L       GRR,12(GRS)                                              
         BCR     15,GRR          RETURN                                   
         SPACE                                                            
*  LI-C   ARGUMENT IS NEGATIVE                                          
ERROR    $ERROR    (TRAZ,LI,C)                                  V1L5 
         SPACE                                                            
BUFF     DS      F                                                        
BIAS     DC      X'31000000'                                              
B        DC      X'00423A2A'     0.2587,  TARGET CHAR -8 TO BE AFFIXED    
A        DC      X'48385F07'     0.2202*16**8                             
         END                                                              
