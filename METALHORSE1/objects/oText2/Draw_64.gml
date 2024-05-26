draw_sprite_stretched(sGround,background,x1,y1,x2,y2);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_red);


var _print = string_copy(msg, 1, textProgress);

if(responses[0] != -1) && (textProgress >= string_length(msg))
{
	for (var i = 0; i < array_length(responses); i++)
	{
		_print += "                      "
		if (i == responseSelected) _print += "> ";
		_print += responses[i]

		
	}
	
}

draw_text((x1+x2)/2, y1+8, _print);

