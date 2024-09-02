//desenhando vida do jogador 
for (var i = 0; i < Obj_jogador.vida; i++)
{
	var _x = 15
	var _y = 15
	var _offset = 100
	
	var _x1 = _x + _offset * i
	gpu_set_fog(true,c_black,0,0)
	draw_sprite(spr_vida,0,_x1,_y)
	gpu_set_fog(false,c_black,0,0)
	
}
for (var i = 0; i < Obj_jogador.vida_atual; i++)
{
	var _x = 15
	var _y = 15
	var _offset = 100
	
	var _x1 = _x + _offset * i
	draw_sprite(spr_vida,0,_x1,_y)
	
	
}
