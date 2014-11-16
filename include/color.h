/* "TNU" Kernel forked is created by the development team:
 * Amaya OS 	<info@amayaos.com>
 * Destinity OS	<team@mycpaccess.tk>
 *
 * The kernel code is based on the original Linux code,
 * it is only a fork as the Android Kernel (Linux Fork),
 * not a replacement from Linux kernel.
 *
 * Copyright (C) 2014  Amaya OS & Destinity OS team
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 *
 */

#ifndef OS_COLOR_API

#define OS_COLOR_API

typedef enum OS_COLOR{
    OS_COLOR_BLACK          = 0,
    OS_COLOR_BLUE           = 1,
    OS_COLOR_GREEN          = 2,
    OS_COLOR_CYAN           = 3,
    OS_COLOR_RED            = 4,
    OS_COLOR_MAGENTA        = 5,
    OS_COLOR_BROWN          = 6,
    OS_COLOR_LIGHT_GREY     = 7,
    OS_COLOR_DARK_GREY      = 8,
    OS_COLOR_LIGHT_BLUE     = 9,
    OS_COLOR_LIGHT_GREEN    = 10,
    OS_COLOR_LIGHT_CYAN     = 11,
    OS_COLOR_LIGHT_RED      = 12,
    OS_COLOR_LIGHT_MAGENTA  = 13,
    OS_COLOR_LIGHT_BROWN    = 14,
    OS_COLOR_WHITE          = 15
} OS_COLOR;

#endif
