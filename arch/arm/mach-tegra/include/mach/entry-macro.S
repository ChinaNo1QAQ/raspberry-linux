/* arch/arm/mach-tegra/include/mach/entry-macro.S
 *
 * Copyright (C) 2009 Palm, Inc.
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

	.macro	disable_fiq
	.endm

	.macro	arch_ret_to_user, tmp1, tmp2
	.endm

#if !defined(CONFIG_ARM_GIC)
	/* legacy interrupt controller for AP16 */

	.macro	get_irqnr_preamble, base, tmp
	@ enable imprecise aborts
	cpsie	a
	@ EVP base at 0xf010f000
	mov \base, #0xf0000000
	orr \base, #0x00100000
	orr \base, #0x0000f000
	.endm

	.macro	get_irqnr_and_base, irqnr, irqstat, base, tmp
	ldr \irqnr, [\base, #0x20]	@ EVT_IRQ_STS
	cmp \irqnr, #0x80
	.endm
#endif
