//string at beginning of level

var halfw = w * 0.5;

//Draw The Box

draw_set_color(c_purple);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border, y-h-(border*2),x+halfw+border,y,15,15,false);
draw_set_alpha(1);

//Draw Text

DrawSetText2(c_white, fSign, fa_center, fa_top);
draw_text(x, y-h-border, text_current);
