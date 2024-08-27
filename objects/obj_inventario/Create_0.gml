// ativações e configuraçoes iniciais
inventario = false
escala = 3 

comeco_x = 15 * escala 
comeco_y = 24 * escala

//tamanho inventario 
slot_h = 8
slot_v = 3
total_slot = slot_h * slot_v
tamanho_slot = 16 *escala
buffer = 1 * escala

inventario_l = sprite_get_width(spr_inventario) * escala 
inventario_a = sprite_get_height(spr_inventario) * escala 

//Movendo itens no inventario 
item_selecionado = -1
pos_selecionada = -1 


//enumerando itens
enum Ingredientes
{
	Acucar, // numero 0
	Amora, // numero 1
	Chantily, // numero 2
	Altura // numero de itens registrados no enum
}

enum Armas 
{
	Espada,
	Bala,
	Escudo,
	Altura
}

enum Infos{ // usado para facilitar a indentificação da coluna de item e de quantidade do grid
	Item,
	Quantidade,
	Sprite,
	Altura
}

//Criando funcionalidade de itens 
grid_itens = ds_grid_create(Infos.Altura,total_slot)
ds_grid_set_region(grid_itens,0,0, Infos.Altura - 1,total_slot - 1, -1)
ds_grid_add_item(Armas.Espada, 1, spr_armas)
ds_grid_add_item(Ingredientes.Acucar, 21, spr_ingredientes)
ds_grid_add_item(Ingredientes.Chantily, 32, spr_ingredientes)
ds_grid_add_item(Armas.Escudo, 3, spr_armas)

