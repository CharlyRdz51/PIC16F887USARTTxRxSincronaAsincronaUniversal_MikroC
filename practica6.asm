
_main:

;practica6.c,3 :: 		void main() {
;practica6.c,4 :: 		ANSEL  = 0;                     // Configure AN pins as digital
	CLRF       ANSEL+0
;practica6.c,5 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;practica6.c,6 :: 		C1ON_BIT=0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;practica6.c,7 :: 		C2ON_BIT=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;practica6.c,8 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;practica6.c,9 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;practica6.c,11 :: 		UART1_Write_Text("Aguilar Rodriguez\n\r");
	MOVLW      ?lstr1_practica6+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;practica6.c,15 :: 		UART1_Write_Text("Universidad de Guadalajara");
	MOVLW      ?lstr2_practica6+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;practica6.c,16 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;practica6.c,17 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;practica6.c,19 :: 		while (1) {                     // Endless loop
L_main1:
;practica6.c,20 :: 		if (UART1_Data_Ready()) {     // If data is received,
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;practica6.c,21 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _uart_rd+0
;practica6.c,22 :: 		UART1_Write(uart_rd);       // and send data via UART
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;practica6.c,23 :: 		}
L_main3:
;practica6.c,24 :: 		}
	GOTO       L_main1
;practica6.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
