// No evento Draw do obj_pause_menu
if (global.is_active) {
    // Desenhar fundo semitransparente
	draw_set_color(c_black)
    draw_set_alpha(0.7);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);
	draw_set_color(-1)

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Definir a fonte grande
    draw_set_font(ft_menu);

    // Desenhar título
    draw_text(display_get_width() / 2, display_get_height() / 2 - 150, "Jogo Pausado");

    // Desenhar opções do menu
    for (var i = 0; i < array_length(menu_options); i++) {
        var y_pos = display_get_height() / 2 + i * 50; // Ajusta a distância entre as opções
        if (i == current_selection) {
            draw_set_color(c_yellow); // Destacar a opção selecionada
        } else {
            draw_set_color(c_white);
        }
        draw_text(display_get_width() / 2, y_pos, menu_options[i]);
    }

    // Resetar as configurações de fonte e cor
    draw_set_color(c_white);
    draw_set_font(-1); // -1 retorna à fonte padrão
}