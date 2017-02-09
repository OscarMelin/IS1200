/* mipslabwork.c

	 This file written 2015 by F Lundevall

	 This file should be changed by YOU! So add something here:

	 This file modified 2015-12-24 by Ture Teknolog 

	 Latest update 2015-08-28 by F Lundevall

	 For copyright and licensing, see file COPYING */

#include <stdint.h>	 /* Declarations of uint_32 and the like */
#include <pic32mx.h>	/* Declarations of system-specific addresses etc */
#include "mipslab.h"	/* Declatations for these labs */

int mytime = 0x5957;

char textstring[] = "text, more text, and even more text!";

/* Interrupt Service Routine */
void user_isr( void )
{
	return;
}

/* Lab-specific initialization goes here */
void labinit( void ) {

	// Set *E to address of TRISE.
	volatile int *E = (volatile int *) 0xbf886100;
	
	// Set last 8 bits to zero, i.e. sets them as output pins.
	*E = *E &0xff00;

	return;
}

/* This function is called repetitively from the main program */
void labwork( void ) {

	volatile int *porte = (volatile int *) 0xbf886110;

	(*porte) += 0x1;

	delay( 1000 );
	time2string( textstring, mytime );
	display_string( 3, textstring );
	display_update();
	tick( &mytime );
	display_image(96, icon);

	

}






