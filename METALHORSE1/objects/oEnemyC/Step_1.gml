if (hp <= 0)
{
	with(instance_create_layer(x, y, layer, oEnemyADeath))
	{
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction)-2;
	}
	
	with(mygun) instance_destroy();
	if (instance_exists(oPlayer))
	{
	
	global.score++
	global.scorethisroom++
	with (oGame) scoretextscale = 2;
	
	
	
}
	instance_destroy();
}
