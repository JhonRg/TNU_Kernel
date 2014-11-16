/* "TNU" Kernel forked is created by the development team:
* Amaya OS <info@amayaos.com>
* Destinity OS <team@mycpaccess.tk>
*
* The kernel code is based on the original Linux code,
* it is only a fork as the Android Kernel (Linux Fork),
* not a replacement from Linux kernel.
*
* Copyright (C) 2014 Amaya OS & Destinity OS team
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
*
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
