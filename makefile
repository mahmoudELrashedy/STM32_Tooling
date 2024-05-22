#var definition
AC=arm-none-eabi-gcc -mcpu=cortex-m4 
LD=-T stm32f401cc_linkerscript.ld -nostdlib
##first rule to generate main.o


# @ for rule name & ($^) for depenedancy 
#rule_name:depenedancies
main.o:main.c
	$(AC) -c $^ -o $@
	
mrcc.o:MRCC_Program.c
	$(AC) -c $^ -o $@
	
mgpio.o:MGPIO_Program.c
	$(AC) -c $^ -o $@
	
stm32f401_startupfile.o:stm32f401_startupfile.c
	$(AC) -c $^ -o $@
	
obj:main.o mrcc.o mgpio.o stm32f401_startupfile.o

clean:
	rm -f-r *.o
	rm -f-r *.elf
	rm -f-r *.map

file.elf:
	$(AC) *.o $(LD) -o $@

file.map:
	$(AC) *.o $(LD) -Wl,-Map=$(@)

Build:clean obj file.elf file.map