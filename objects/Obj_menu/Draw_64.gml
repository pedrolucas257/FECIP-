// definindo fonte e centro 
draw_set_font(ft_menu)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

// Pegando posição do mouse
var _mx = device_mouse_x_to_gui(0)
var _my = device_mouse_y_to_gui(0)

// loop de desenho do menu
var tam_menu = array_length(menu_i)
for( var i = 0; i< tam_menu; i++)
{// pegando altura e largura da tela
	var _wgui = display_get_gui_width()
	var _hgui = display_get_gui_height()
	
	// pegando tamanho da string 
	var _hstr = string_height("I")
	var _wstr = string_width(menu_i[i])
	
	// variaveis para definição da posição do retangulo
	var x1 = _wgui / 2 - _wstr / 2 
	var y1 = _hgui / 2 - _hstr / 2 + _hstr * i
	
	var x2 = _wgui / 2 + _wstr / 2 
	var y2 = _hgui / 2 + _hstr / 2 + _hstr * i
	
	//Opção selecionada e animação do menu
	if(point_in_rectangle(_mx, _my,x1, y1, x2, y2))
	{
		escala[i] = lerp(escala[i], 1.4, 0.15)
		//Checagem de ação do mouse
		if(mouse_check_button_pressed(mb_left))
		{
			switch menu_i[i]
			{
				case menu_i[0]:
					room_goto(R_fase1_parte1)
					break
				case menu_i[1]:
					show_message("Vc clicou em opções")
					break
				case menu_i[2]:
					show_message("Vc clicou em creditos")
					break
				case menu_i[3]:
					game_end()
					break
			}
		}
	}else
	{
		escala[i] = lerp(escala[i], 1, 0.15)
	}
	
	draw_text_transformed(_wgui / 2 , _hgui / 2 + _hstr * i,menu_i[i],escala[i],escala[i],0)
}

// resetando fonte e meio
draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)