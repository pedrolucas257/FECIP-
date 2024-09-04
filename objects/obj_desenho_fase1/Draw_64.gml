draw_set_alpha(opacidade); // Configura a transparência
draw_set_font(ft_desenho); // Defina a fonte que deseja usar
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(display_get_width() / 2, display_get_height() / 2, texto);
draw_text(display_get_width() / 2, (display_get_height() / 2) - 35, texto_2);// Desenha no meio da tela
draw_set_alpha(1); // Restaura a opacidade para outros desenhos
draw_set_font(-1)