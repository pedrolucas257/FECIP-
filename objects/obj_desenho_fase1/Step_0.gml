if (tempo_exibicao > 0) {
    tempo_exibicao -= 1;
} else {
    opacidade -= 0.01; // Reduz a opacidade gradualmente
    if (opacidade <= 0) {
        opacidade = 0; // Garante que a opacidade não fique negativa
        instance_destroy(); // Destroi o objeto quando o texto desaparecer completamente
    }
}