if place_meeting(x,y, obj_hitbox)
{
	vida -= 1
}

if vida <= 0
{
	instance_destroy(obj_inimigo)
}