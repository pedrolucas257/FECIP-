script_execute(estado)

setinha_cima = keyboard_check_pressed(vk_up)

/*if place_meeting(x, y  + vveloc, obj_coisa_ruim)
{
	vida_perso.perder_vida(1)	
}
*/
if setinha_cima
{
	vida_perso.ganhar_vida(5)
}
// if de criaçao da instancia do item solto no chão 
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
if keyboard_check_pressed(ord("R"))
{
	room_restart()
}

// destruindo caixa
if (keyboard_check_pressed(ord("Q"))) {
	
	//distancia pra quebrar a caixa rs
    var max_distance = 50;
    var caixa = instance_nearest(x, y, obj_caixa);
    if (caixa != noone && point_distance(x, y, caixa.x, caixa.y) <= max_distance) {
        //caixa explosão
        caixa.sprite_index = spr_caixa_explodindo;
        caixa.image_index = 0;
        // reproduz só uma vez
        caixa.image_speed = 1;
		
        caixa.exploding = true;
    }
}