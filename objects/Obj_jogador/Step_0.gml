
if vida <= 0{instance_destroy(Obj_jogador)}
if global.is_active == true{exit}
script_execute(estado)


// if de criaçao da instancia do item solto no chão 
#region
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
#endregion
if keyboard_check_pressed(ord("R"))
{
	room_restart()
}
//Combate
#region
if alarm[0] > 0
{
	if image_alpha >= 1{alfa_hit = -0.05}
	else if image_alpha <= 0{ alfa_hit = 0.05}
	image_alpha += alfa_hit
}
#endregion

// destruindo caixa
#region
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
#endregion

//escada falhada
#region
if place_meeting(x,y,obj_escada){

	if keyboard_check(ord("W")){
		vveloc = -3;
		gravidade = 0;
	} else if keyboard_check(ord("S")){
		vveloc=3;
		gravidade = 0;
	}
	else{
		vveloc = 0;
	}
}
else{
	gravidade = 0.09;
}
#endregion