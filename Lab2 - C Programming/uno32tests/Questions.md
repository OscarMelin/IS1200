#Questions for assignment 5

Before the oral exam, you should prepare the answers to the following questions. You will need to be able to answer these questions to pass the assignment.

##Consider AM18, AM19, and AF1. Explain why gv ends up with the incremented value, but m does not.

m is never incremented, function fun() copies the value of m to param and increments param. gv is incremented directly.

##Pointer cp is a character pointer that points to a sequence of bytes. What is the size of the cp pointer itself?

32 bits, for example 0xA0003FE4

##Explain how a C string is laid out in memory. Why does the character string that cp points to have to be 9 bytes?

Because it consists of 8 characters + a null terminator which totals to 9 bytes.

##Which addresses have fun and main? Which sections are they located in? What kind of memory are they stored in? What is the meaning of the data that these symbols points to?

Addresses in the "Program Flash" section. The data is the binary machine code of the functions.

###Before the examination, you should also try to answer the following. When the lab -ssistant performs the examination, he/she can also clarify anything that you did not understand with the following questions:

####Which addresses are variables in and gv located at? Which memory sections according to the PIC32 memory map? Why?

####Variables p and m are not global variables. Where are they allocated? Which memory section is used for these variables? Why are the address numbers for p and m much larger than for in and gv?

####At print statement AM5, what is the address of pointer p, what is the value of pointer p, and what value is pointer p pointing to?

####At print statement AM7, what is the address of pointer p, what is the value of pointer p, and what value is pointer p pointing to?

####Consider AM14 to AM17. Is the PIC32 processor using big-endian or little-endian? Why?