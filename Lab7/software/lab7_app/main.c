// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
	int i, accum = 0;
	volatile unsigned int *LED_PIO = (unsigned int*)0x50; //make a pointer to access the PIO block
	volatile unsigned int *SW_PIO = (unsigned int*)0x20;
	volatile unsigned int *KEY2_PIO = (unsigned int*)0x40;
	volatile unsigned int *KEY3_PIO = (unsigned int*)0x30;
	*LED_PIO = 0; //clear all LEDs

	char * zuofu = "lord";


	while(0 != zuofu)
	{
		if(*KEY2_PIO == 0x1){
			*LED_PIO = 0;
		}
		if(*KEY3_PIO == 0x1 && (accum == 0)){
			*LED_PIO += *SW_PIO;
			accum = 1;
		}
		if(*KEY3_PIO == 0x0){
			accum = 0;
		}
	}

	/*
	while ( (1+1) != 3) //infinite loop
	{
		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO |= 0x1; //set LSB
		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO &= ~0x1; //clear LSB
	}
	return 1; //never gets here
	*/

}