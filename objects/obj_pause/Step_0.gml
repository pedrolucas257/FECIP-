// No evento Step do obj_pause_menu
if (keyboard_check_pressed(ord("P"))) {
    global.is_active = !global.is_active;
}

// Verifique se o menu está ativo antes de executar a lógica de pausa
if (global.is_active) {
    // Navegação no menu de pausa
    if (keyboard_check_pressed(vk_down)) {
        current_selection = (current_selection + 1) mod array_length(menu_options);
    }

    if (keyboard_check_pressed(vk_up)) {
        current_selection -= 1;
        if (current_selection < 0) {
            current_selection = array_length(menu_options) - 1;
        }
    }

    // Seleção de opção com Enter
    if (keyboard_check_pressed(vk_enter)) {
        if (menu_options[current_selection] == "Continuar") {
            global.is_active = false;  // Desativa o menu de pausa
        } else if (menu_options[current_selection] == "Reiniciar") {
            room_restart();  // Reinicia a sala atual
        } else if (menu_options[current_selection] == "Voltar ao Menu") {
            room_goto(R_menu);  // Substitua pelo nome da sua sala de menu principal
        }
    }
}