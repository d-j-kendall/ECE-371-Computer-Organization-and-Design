; memfile2.asm
; david_harris@hmc.edu and sarah_harris@hmc.edu 
MAIN	SUB  R0, R15, R15
		ADD  R1, R0, #255 ; R1 = 255 = XFF
		ADD  R2, R1, R1   ; R2 = 2*255 = 510 = X1FE
		STR  R2, [R0, #196] ; R2 = 0+196 = R2 = mem(196)?
		EOR  R3, R1, #77 ; R3 = 255-77 = 178 = XB2
		AND  R4, R3, #0x1F; R4 = XB2 & X1F = X12
		ADD  R5, R3, R4   ; R5 = X12+XB2 = XC4
		LDRB R6, [R5]     ; 
		LDRB R7, [R5, #1]
		CMP	 R6, R7
		BLT  MAIN
		BGT  HERE
		STR  R1, [R4, #110]
		B 	MAIN
HERE	STR  R6, [R4, #110]
