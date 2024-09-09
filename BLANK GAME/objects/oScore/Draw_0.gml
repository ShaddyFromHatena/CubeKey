draw_self();

draw_set_font(fnt_ui);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

total_score = instance_find(gameManager,0).total_score;

draw_text(x,y,total_score);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
