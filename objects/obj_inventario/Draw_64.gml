var _guil = display_get_gui_width()
var guia = display_get_gui_height()

var _mx = device_mouse_x_to_gui(0)
var _my = device_mouse_y_to_gui(0)

if (inventario == true)
{
	//definindo o inventario no centro da tela 
	var _invx = _guil/2 - inventario_l/2
	var _invy = guia/2 - inventario_a/2
	
	draw_sprite_ext(spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white,1)
	//funcionalidade do inventario
	var ix = 0
	var iy = 0
	for( var i = 0 ; i < total_slot; i++)
	{
		var _slotx = _invx + comeco_x + ((tamanho_slot + buffer) *ix)
		var _sloty = _invy + comeco_y + ((tamanho_slot + buffer) *iy)
		
		if point_in_rectangle(_mx,_my,_slotx,_sloty,_slotx + tamanho_slot, _sloty + tamanho_slot)
		{
			draw_sprite_ext(spr_seletor, 0, _slotx, _sloty, escala, escala,0, c_white,1)
			
			//dropando do inventario 
			if selecionado == false{
				if keyboard_check_pressed(ord("F")) and grid_itens[# Infos.Item, i] != -1
				{
					var _instancia = instance_create_layer(Obj_jogador.x, Obj_jogador.y, "Instances", obj_item)
					_instancia.sprite_index = grid_itens[# Infos.Sprite, i]
					_instancia.image_index = grid_itens[# Infos.Item, i]
					_instancia.quantidade = grid_itens[# Infos.Quantidade, i]
				
					//esvaziando slot 
					grid_itens[# Infos.Item, i] = -1
					grid_itens[# Infos.Quantidade, i] = -1
					grid_itens[# Infos.Sprite, i] = -1
				}
			}
			
			if mouse_check_button_pressed(mb_left)
			{//caso n tenha item selecionado
				if item_selecionado == -1
				{
					selecionado = false 
					item_selecionado = grid_itens[# Infos.Item, i]
					pos_selecionada = i 
				}else{ //caso tenha
				// 1- caso o item selecionado seja igual ao q nos vamos colocar = agrupar
				if item_selecionado == grid_itens[# Infos.Item, i] and pos_selecionada != i and grid_itens[# Infos.Sprite, i] == grid_itens[# Infos.Sprite, pos_selecionada]
				{
					selecionado = true
					grid_itens[# Infos.Quantidade, i] +=  grid_itens[# Infos.Quantidade,pos_selecionada]
					
					grid_itens[# Infos.Item, pos_selecionada] = -1
					grid_itens[# Infos.Quantidade, pos_selecionada] = -1 
					item_selecionado = -1
					pos_selecionada = -1 
				}
				// 2 - Caso slot selecionado seja vazio = adicionar item
				else if grid_itens[# Infos.Item, i] == -1 
				{
					grid_itens[# Infos.Item, i] = grid_itens[# Infos.Item, pos_selecionada]
					grid_itens[# Infos.Quantidade, i] = grid_itens[# Infos.Quantidade, pos_selecionada]
					grid_itens[# Infos.Sprite, i] = grid_itens[# Infos.Sprite, pos_selecionada]
					
					grid_itens[# Infos.Item, pos_selecionada] = -1
					grid_itens[# Infos.Quantidade, pos_selecionada] = -1 
					grid_itens[# Infos.Sprite, pos_selecionada] = -1 
					item_selecionado = -1
					pos_selecionada = -1 
				}
				
				// 3- caso slot tenha item diferente selecionado = trocar de lugar 
				else if grid_itens[# Infos.Item, pos_selecionada] != grid_itens[# Infos.Item, i] or grid_itens[# Infos.Sprite, pos_selecionada] != grid_itens[# Infos.Sprite, i]
				{
					var _item = grid_itens[# Infos.Item, i] 
					var _quantidade = grid_itens[# Infos.Quantidade, i]
					var _spr = grid_itens[# Infos.Sprite, i]
					
					grid_itens[# Infos.Item, i] = grid_itens[# Infos.Item, pos_selecionada]
					grid_itens[# Infos.Quantidade, i] = grid_itens[# Infos.Quantidade, pos_selecionada]
					grid_itens[# Infos.Sprite, i] = grid_itens[# Infos.Sprite, pos_selecionada]
					
					grid_itens[# Infos.Item, pos_selecionada] = _item
					grid_itens[# Infos.Quantidade, pos_selecionada] = _quantidade
					grid_itens[# Infos.Sprite, pos_selecionada] = _spr
					
					item_selecionado = -1
					pos_selecionada = -1 
				}	
				}
			}
		}
		var _sprite = grid_itens[# Infos.Sprite, i]
		
		if grid_itens[# Infos.Item, i] != -1
		{
			draw_sprite_ext(_sprite, grid_itens[# 0, i], _slotx, _sloty,escala, escala, 0, c_white, 1)
			
			draw_set_font(ft_menu)
			draw_set_halign(fa_center)
			draw_text_colour_outline(_slotx + tamanho_slot, _sloty + (tamanho_slot /2 ) , grid_itens[# Infos.Quantidade, i], 4, c_black, 16, 100, 100)
		}
		
		ix++
		if (ix >= slot_h)
		{
			ix = 0
			iy++
		}
		
	}
	
	if mouse_check_button(mb_right){item_selecionado = -1; pos_selecionada = -1}
	
	if item_selecionado != -1
	{
		draw_sprite_ext(grid_itens[# Infos.Sprite, pos_selecionada], item_selecionado, _mx, _my, escala, escala, 0, c_white, 0.5)
	}
}