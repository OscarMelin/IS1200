This project contains a program to explore memory in Uno32
and browse the results.

The project contains the following source files:

main.c:
	Contains the entry point main()
        and code to study how pointers and variables behave.

u32helpers.c:
	Contains functions to save and display results.
	These functions must be called from main().
	Call savebyte() or saveword() to save info about an address.
	As the very last line in main(), call showinfo() to display
	the saved stuff. Showinfo runs an infinite loop and
	reads the buttons to select what to display.
	BTN4 = prevoius item
	BTN3 = go to the first saved item
	BTN2 = next item
	BTN4 and BTN2 wrap around from first to last and vice versa.

vectors.S:
	Contains the interrupt handler and the exception handler

stubs.c:
	Contains stubs for functions run during micro controller
	initialization
