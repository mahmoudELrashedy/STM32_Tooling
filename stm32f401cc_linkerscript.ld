ENTRY(Reset_Handler) /*Entry point definition*/

MEMORY
{
	FLASH(rx) : ORIGIN = 0x08000000 ,LENGTH = 256k
	SRAM(rwx) : ORIGIN = 0x20000000 ,LENGTH = 20k
}

SECTIONS
{
	.text :
	{
		*(.isr_vector)
		*(.text)	/*all the .text in .c files*/
		*(.rodata)
		e_text = . ; 
	}>FLASH AT > FLASH      /*>VMA AT > LMA*/
	
	.bss :
	{
		s_bss = . ;
		*(.bss)
		e_bss = . ;
	}>SRAM 
	
	.data :
	{
		s_data = . ;
		*(.data)
		e_data = . ;
	}>SRAM AT > FLASH
	
	. = ALIGN(4);
	
	
}