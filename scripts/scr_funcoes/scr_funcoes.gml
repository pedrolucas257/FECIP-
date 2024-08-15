

function draw_text_colour_outline(){ // desenho da cor de texto ao redor 

//Created by Andrew McCluskey http://nalgames.com/

///@arg x

///@arg y

///@arg str

///@arg outwidth

///@arg outcol

///@arg outfidelity

///@arg separation

///@arg width

//2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)

	var dto_dcol = draw_get_color();

	draw_set_color(argument4);

	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)

	{

	//draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);

		draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);

	}

		draw_set_color(dto_dcol);

		draw_text_ext(argument0,argument1,argument2,argument6,argument7);

	}

function ds_grid_add_item() // adicionar item ao inventario 
{// 3 Argumentos = item, quantidade e spr
	
	var _grid = obj_inventario.grid_itens
	var _checagem = 0;
	while _grid[# Infos.Item, _checagem] != -1
	{
		_checagem++
	}
	_grid[# 0, _checagem] = argument[0]
	_grid[# 1, _checagem] = argument[1]
	_grid[# 2, _checagem] = argument[2]
	
}

function scr_fim_animacao()
{
	var _sprite = sprite_index
	var _image = image_index
	if argument_count > 0 _sprite = argument[0]
	if argument_count > 1 _image = argument[1]
	var _type = sprite_get_speed_type(sprite_index)
	var _spd = sprite_get_speed(sprite_index)*image_index
	if _type == spritespeed_framespergameframe
	{
		_spd = _spd / room_speed
	}
	if argument_count > 2 _spd = argument[2]
	return _image + _spd = sprite_get_number(_sprite)
	
}