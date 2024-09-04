//batendo na parede
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
//gravidade 
// Aplicar gravidade
if (!place_meeting(x,y + 5,obj_chao)) {
    velocidade_vertical += gravidade; // Aumenta a velocidade de queda
    if (velocidade_vertical > velocidade_maxima) {
        velocidade_vertical = velocidade_maxima; // Limita a velocidade de queda
    }
} else {
    velocidade_vertical = 0; // Reseta a velocidade vertical se estiver no chão
}
// Aplicar movimento vertical (queda)
y += velocidade_vertical;

