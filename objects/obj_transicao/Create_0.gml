
tamanho = sprite_get_width(spr_transicao)
colunas = ceil(room_width / tamanho)
linhas = ceil(room_height / tamanho)

//variaveis animaçao

img = 0

img_vel = sprite_get_speed(spr_transicao) / game_get_speed(fps)

//total da animação (limitando ela)
img_num = sprite_get_number(spr_transicao) -1