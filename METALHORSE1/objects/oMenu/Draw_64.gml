//Draw Menu

draw_set_font(fMenu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

//for loop
for (var i =0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i)
	{
		txt = string_insert("> ", txt, 0);
		var col = c_red;
	} else {
		var col = c_blue;
		
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i *1.5));

draw_set_color(col);	
draw_text(xx,yy,txt);

}
