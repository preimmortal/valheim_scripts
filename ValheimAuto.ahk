#SingleInstance force
F7::preAutoJump()
F8::preAutoRun()

preAutoJump(Speed=1500)
{
	static Toggle
	Toggle := !Toggle
	Period := Toggle ? Speed : "off"
	
	SetTimer, SubmitAction, %Period%
	Return
	
	SubmitAction:
	Send, {Space}
	Sleep 1000
	Return
}


preAutoRun(Speed=4500)
{
	static Toggle
	Toggle := !Toggle
	Period := Toggle ? Speed : "off"
	
	SetTimer, SubmitRun, %Period%
	Return
	
	SubmitRun:
	Send, {w down}
	Sleep, 100
	Send, {Shift down}
	Sleep, 2000
	Send, {Shift up}
	Sleep, 100
	Send, {w up} 
	Sleep, 100
	Send, {Space}
	
	Return
}
