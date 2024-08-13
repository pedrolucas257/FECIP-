direita = keyboard_check(ord("D"))
esquerda =  keyboard_check(ord("A"))
cima = keyboard_check_pressed(ord("W"))
setinha_cima = keyboard_check_pressed(vk_up)

hveloc = (direita - esquerda) * veloc

if !place_meeting(x, y + 1, obj_chao)
{
	vveloc += gravidade
}else
{
	if cima
	{
		vveloc = -2.8
	}
}
if place_meeting(x + hveloc, y, obj_chao)
{
	while !place_meeting(x + sign(hveloc), y, obj_chao)
	{
		x += sign(hveloc)
	}
	
	hveloc = 0 
}

if place_meeting(x, y  + vveloc, obj_chao)
{
	while !place_meeting(x , y + sign(vveloc), obj_chao)
	{
		y += sign(vveloc)
	}
	
	vveloc = 0 
}

x += hveloc
y += vveloc

if place_meeting(x, y  + vveloc, obj_coisa_ruim)
{
	vida_perso.perder_vida(1)	
}

if setinha_cima
{
	vida_perso.ganhar_vida(5)
}

if instance_exists(obj_item) and obj_inventario.inventario == false 
{
	var _instancia = instance_nearest(x,y, obj_item)
	if distance_to_point(_instancia.x, _instancia.y) <= 20{
		if keyboard_check_pressed(ord("F"))
		{
			ds_grid_add_item(_instancia.image_index, _instancia.quantidade, _instancia.sprite_index)
			instance_destroy(_instancia)
		}
	}
}