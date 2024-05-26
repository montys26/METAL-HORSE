//draw to display 
//draw score

if (room != Menu) && (instance_exists(oPlayer)) && (global.score > 0)
{
	scoretextscale = max(scoretextscale * 0.95, 1);
	DrawSetText2(c_red, fMenu, fa_right, fa_top);
	draw_text_transformed(RES_W + 308, 0, string(global.scorethisroom), scoretextscale, scoretextscale, 0) ;
}