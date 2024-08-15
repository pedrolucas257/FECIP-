if place_meeting(x, y, obj_parede){
 if direc == 0{
	 direc = 1;
 }else if direc == 1{
	  direc = 0;
 }
}

 //andando para a direita
if direc == 0{
	sprite_index = spr_inimigo
	x += veloc;
}//andando para a esquerda
else if direc == 1{
	sprite_index = spr_inimigo
	x -= veloc;
}