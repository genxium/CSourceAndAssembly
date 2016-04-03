# to generate 32-bit-based output on a 64-bit OS, one needs
# 'libc6-dev-i386' on 64-bit Ubuntu, or 
# 'glibc-devel.i686' on 64-bit CentOS/RHEL (NOT tested yet),
# but this is NOT recommended 
bus_option=-m64
dialect=intel
std_option=c99
# disable 'call frame information', a.k.a cfi directives
cfi_option=-fno-asynchronous-unwind-tables

# reference http://www.systutorials.com/240/generate-a-mixed-source-and-assembly-listing-using-gcc/
# -Wa,options: pass options to assembler 
# -adhln: 'a' turns on listing, 'd' omits debugging directives, 'n' omits forms processing, 'h' includes high level source, 'l' includes assembly
asm_listing_options=-Wa,-adhln

all: simple.out simple.s tail_recursion.s

simple.out: simple.c
	gcc -g $(bus_option) -std=$(std_option) -masm=$(dialect) $(cfi_option) $(asm_listing_options) simple.c -o simple.out > simple.lst

simple.s: simple.c
	gcc -S $(bus_option) -std=$(std_option) -masm=$(dialect) $(cfi_option) simple.c -o simple.s 

tail_recursion.s: tail_recursion.c 
	gcc -S $(bus_option) -std=$(std_option) -masm=$(dialect) $(cfi_option) tail_recursion.c -o tail_recursion.s 

clean:
	rm -rf simple.s simple.o simple.out simple.lst
