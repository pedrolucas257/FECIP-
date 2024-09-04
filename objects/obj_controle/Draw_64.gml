//desenhando cabeça 
var _xc = -15
var _yc = -15
if Obj_jogador.vida_atual >= 4
{
	draw_sprite_ext(spr_cabeca, 0, _xc, _yc, 2, 2, 0, c_white, 1);
}else if Obj_jogador.vida_atual <= 3 and Obj_jogador.vida_atual > 0 {draw_sprite_ext(spr_cabeca, 1, _xc, _yc, 2, 2, 0, c_white, 1);}
else if Obj_jogador.vida_atual <= 0 {draw_sprite_ext(spr_cabeca, 2, _xc, _yc, 2, 2, 0, c_white, 1)}

//desenhando vida do jogador 
for (var i = 0; i < Obj_jogador.vida; i++)
{
	var _x = 85
	var _y = 15
	var _offset = 50
	
	var _x1 = _x + _offset * i
	gpu_set_fog(true,c_black,0,0)
	draw_sprite(spr_vida,0,_x1,_y)
	gpu_set_fog(false,c_black,0,0)
	
}
for (var i = 0; i < Obj_jogador.vida_atual; i++)
{
	var _x = 85
	var _y = 15
	var _offset = 50
	
	var _x1 = _x + _offset * i
	draw_sprite(spr_vida,0,_x1,_y)
	
	
}
