# 
# Copyright (C) 2011-2014 Jeff Bush
# 
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Library General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
# 
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Library General Public License for more details.
# 
# You should have received a copy of the GNU Library General Public
# License along with this library; if not, write to the
# Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
# Boston, MA  02110-1301, USA.
# 


					.text
					.globl _start
					.align 4
					.type _start,@function
_start:				load_32 sp, stacks_base
					getcr s0, 0			; get my strand ID
					shl s0, s0, 13		; 8192 bytes per stack
					add_i sp, sp, s0	; Compute stack address

					call main
					setcr s0, 29		; Stop thread
done:				goto done

stacks_base:		.long 0x1012e000	; end of FB + 8192 bytes

