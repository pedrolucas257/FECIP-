if alarm[0] <= 0{
	vida -= 1
	alarm[0] = 30
}
if vida <= 0
{
	instance_destroy()
}