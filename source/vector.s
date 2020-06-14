.section .vector

	ldr pc,[pc,#28]
	ldr pc,[pc,#28]
	ldr	pc,[pc,#28]
	ldr pc,[pc,#28]
	ldr pc,[pc,#28]
	ldr pc,[pc,#28]
	ldr	pc,[pc,#28]
	ldr pc,[pc,#28]

.section .runtime

	.word __stack_end
	.word __handler_reset
	.word __handler_default
	.word __handler_default
	.word __handler_default
	.word __handler_default
	.word __handler_default
	.word __handler_default
	.word __handler_default

.section .exchange

	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0
