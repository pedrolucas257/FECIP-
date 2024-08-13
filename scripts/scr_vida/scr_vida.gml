
function scr_vida(_vida_max) constructor{
	vida_max = _vida_max
	
	// atual
	vida = vida_max
	vida_temp = vida
	vida_fundo = vida
	static perder_vida = function(_quantidade = 1)
	{
		vida -= _quantidade 
		vida = clamp(vida,0, vida_max)
		return vida
	}
	
	static ganhar_vida = function(_quantidade = 1)
	{
		vida += _quantidade
		vida = clamp(vida,0, vida_max)
		return vida
	}
	//metodo de desenhar
	static desenhar_vida = function(_x,_y,_largura,_altura, _cor1 = c_green,_cor2 = c_red,_cor3 = c_white)
	{
		//largura da barra de acordo com a vida 
		var _larg_vida = (vida_temp / vida_max) * _largura
		var _larg_vida2 = (vida_fundo / vida_max) * _largura 
		var _cor = merge_color(_cor2, _cor1, vida_temp / vida_max)
		//alterando valor da vida temp
		vida_temp = lerp(vida_temp, vida, 0.04)
		vida_fundo = lerp(vida_fundo, vida_temp, 0.04)
		//desenhando background da barra
		draw_rectangle_color(_x - 2,_y - 2,_x + _largura + 2,_altura + 2,_cor3,_cor3,_cor3,_cor3, false)
		//barra do efeito
		draw_rectangle_color(_x,_y,_x +_larg_vida2,_altura,_cor2,_cor2,_cor2,_cor2, false)
		
		//desenhando barra
		draw_rectangle_color(_x,_y, _x +_larg_vida,_altura,_cor,_cor,_cor,_cor, false)

		
	}

}