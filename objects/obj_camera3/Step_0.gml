// Move a câmera para a direita
camera_x += camera_speed;

// Atualiza a view da câmera para seguir a posição definida
camera_set_view_pos(view_camera[0], camera_x, camera_y);

if (camera_x + view_wport[0] < room_width) {
    camera_x += camera_speed;
}
