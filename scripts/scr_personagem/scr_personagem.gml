
function scr_personagem_movendo(){ // script personagem movendo 
	direita = keyboard_check(ord("D"))
	esquerda =  keyboard_check(ord("A"))
	cima = keyboard_check_pressed(ord("W"))
	image_xscale = 1

	hveloc = (direita - esquerda) * veloc
	if direita
	{ 
		direc = 0
		sprite_index = spr_personagem_andando_d
	}else if esquerda
	{
		direc = 1
		sprite_index = spr_personagem_andando_e
	}else
	{
		sprite_index = spr_jogador
	}
	//movimentação e colisão
	if !place_meeting(x, y + 1, obj_chao)
	{
		vveloc += gravidade
	}else
	{
		if cima
		{
			vveloc = -4.8
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
	
	if mouse_check_button_pressed(mb_left)
	{
		image_index = 0
		estado = scr_personagem_atacando
	}
}

function scr_personagem_atacando(){
	//estado ataque
	if direc == 0
	{
		instance_create_layer(x + 35,y, "Instances",obj_hitbox)
		sprite_index = spr_atacando_d
		if image_index >= image_number - 1
		{
			estado = scr_personagem_movendo
			if instance_exists(obj_hitbox)
			{
				instance_destroy(obj_hitbox)
			}
		}
	}
	if direc == 1
	{
		instance_create_layer(x - 35,y, "Instances",obj_hitbox)
		sprite_index = spr_atacando_esquerda
		if image_index >= image_number - 1
		{
			estado = scr_personagem_movendo
			if instance_exists(obj_hitbox)
			{
				instance_destroy(obj_hitbox)
			}
		}
	}
	
}