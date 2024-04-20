#line 1 "C:/Users/user/Desktop/practica 6/practica6.c"
char uart_rd;

void main() {
 ANSEL = 0;
 ANSELH = 0;
 C1ON_BIT=0;
 C2ON_BIT=0;
 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Aguilar Rodriguez\n\r");



 UART1_Write_Text("Universidad de Guadalajara");
 UART1_Write(10);
 UART1_Write(13);

 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 }
 }
}
