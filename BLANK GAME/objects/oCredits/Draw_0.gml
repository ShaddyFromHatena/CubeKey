image_alpha = 0.5;

draw_self();

image_alpha = 1;

draw_set_font(fnt_ui);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x,y-100,"Credits:")

draw_set_font(fnt_credits);

draw_text(x,y-10,"Artwork: Memorable Man\n Coding: Nine and Cuppaint17\n Music: SileNoTE and Cuppaint17");

draw_set_font(fnt_credits_small);

draw_text(x,y+100,"Jazzskull by Cathy Jarboe\nTrumpet SFX from pixabay");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
