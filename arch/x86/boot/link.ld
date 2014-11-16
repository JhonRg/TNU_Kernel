/* "Linker" script by Inlogic & Amaya OS Team's
 *	Inlogic <info@mycpaccess.tk>
 *	AmayaOS <info@amayaos.com>
 *
 *	licenced by GNU GPL v2
 */
ENTRY(_kernel_start)
TARGET("elf32-i386")
OUTPUT_FORMAT("elf32-i386")

phys = 0x00100000;
virt = 0x00100000;

SECTIONS
{
    . = 0x00100000;
    kernelStart = .;

    /DISCARD/ :
    {
        *(.note.gnu.build-id)
    }

    .text virt : AT(phys)
    {
	code = .;
	*(.text)
	*(*.text)
	*(.gnu.linkonce.*)
	*(.rodata)
	*(.rodata.*)
	*(.eh_frame)
	. = ALIGN(4096);
    }

    .data : AT (phys + (data - code))
    {
	data = .;
	*(.data)

        CTOR_LIST = .;
	KEEP (*(SORT(.ctors.*)))
	KEEP (*(.ctors))
	LONG(0)
        CTOR_END = .;

        DTOR_LIST = .;
	KEEP (*(SORT(.dtors.*)))
	KEEP (*(.dtors))
        LONG(0)
        DTOR_END = .;
	. += 4;

	initStart = .;
	KEEP (*(SORT(.init*)))
	initEnd   = .;
	. = ALIGN(4096);
    }

    .bss : AT(phys + (bss - code))
    {
	bss = .;
	*(.bss)
	*(.bss.*)
	*(COMMON)

        . += 4;
	kernelEnd = .;

	. = 0x00400000;
    }
}
