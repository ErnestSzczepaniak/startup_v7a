MEMORY
{
  	SDRAM (rwx) : ORIGIN = __sdram_start, LENGTH = __sdram_size
	OCRAM (rwx) : ORIGIN = __ocram_start, LENGTH = __ocram_size
}

SECTIONS
{
	/*---------------------------------------------| info |---------------------------------------------*/

	__text_start = .;

	.text : ALIGN_WITH_INPUT
	{
		__vector_start = .;
		KEEP(*(.vector))

		__runtime_start = .;
		KEEP(*(.runtime))

		__exchange_start = .;
		KEEP(*(.exchange))

		*(.text*)

		KEEP(*(.init))
		KEEP(*(.fini))

		/* .ctors */
		*crtbegin.o(.ctors)
		*crtbegin?.o(.ctors)
		*(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
		*(SORT(.ctors.*))
		*(.ctors)

		/* .dtors */
 		*crtbegin.o(.dtors)
 		*crtbegin?.o(.dtors)
 		*(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
 		*(SORT(.dtors.*))
 		*(.dtors)

		*(.rodata*)

		KEEP(*(.eh_frame*))
	} > SDRAM

	. = ALIGN(4);
	__text_end = .;
	__text_size = __text_end - __text_start;

	/*---------------------------------------------| extab |---------------------------------------------*/

	__extab_start = .;

	.ARM.extab : ALIGN_WITH_INPUT
	{
		*(.ARM.extab* .gnu.linkonce.armextab.*)
	} > SDRAM

	. = ALIGN(4);
	__extab_end = .;
	__extab_size = __extab_end - __extab_start;

	/*---------------------------------------------| exidx |---------------------------------------------*/

	__exidx_start = .;

	.ARM.exidx : ALIGN_WITH_INPUT
	{
		*(.ARM.exidx* .gnu.linkonce.armexidx.*)
	} > SDRAM

	. = ALIGN(4);
	__exidx_end = .;	
	__exidx_size = __exidx_end - __exidx_start;

	/*---------------------------------------------| data |---------------------------------------------*/

	__data_start = .;

	.data : ALIGN_WITH_INPUT
	{
		*(vtable)
		*(.data*)
	
		. = ALIGN(4);
		/* preinit data */
		PROVIDE_HIDDEN (__preinit_array_start = .);
		KEEP(*(.preinit_array))
		PROVIDE_HIDDEN (__preinit_array_end = .);

		. = ALIGN(4);
		/* init data */
		PROVIDE_HIDDEN (__init_array_start = .);
		KEEP(*(SORT(.init_array.*)))
		KEEP(*(.init_array))
		PROVIDE_HIDDEN (__init_array_end = .);

		. = ALIGN(4);
		/* finit data */
		PROVIDE_HIDDEN (__fini_array_start = .);
		KEEP(*(SORT(.fini_array.*)))
		KEEP(*(.fini_array))
		PROVIDE_HIDDEN (__fini_array_end = .);

		KEEP(*(.jcr*))
	} > SDRAM

	. = ALIGN(4);
	__data_end = .;
	__data_size = __data_end - __data_start;

	/*---------------------------------------------| bss |---------------------------------------------*/

	__bss_start = .;

	.bss (NOLOAD) : ALIGN_WITH_INPUT
	{
		*(.bss*)
		*(COMMON)
	} > SDRAM

	. = ALIGN(4);
	__bss_end = .;
	__bss_size = __bss_end - __bss_start;

	/*---------------------------------------------| stack |---------------------------------------------*/

	__stack_start = .;

	.stack (NOLOAD) : ALIGN_WITH_INPUT
  	{
		. += __stack_size;	
  	} > SDRAM

	. = ALIGN(4);
	__stack_end = .;

	/*---------------------------------------------| pool |---------------------------------------------*/

	/*

	__pool_start = .;

	.pool (NOLOAD) : ALIGN_WITH_INPUT
  	{
		. += __pool_size;
  	} > SDRAM

	. = ALIGN(4);
	__pool_end = .;

	*/

	/*---------------------------------------------| end |---------------------------------------------*/

	end = .;
}

ENTRY(__vector_start)