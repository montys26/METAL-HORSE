x = owner.x;
y= owner.y+10;

image_xscale = abs (owner.image_xscale);
image_yscale = abs(owner.image_yscale);

recoil = max(0, recoil -1 );
if (instance_exists(oPlayer))
{
	if(point_distance(oPlayer.x,oPlayer.y,x,y) < 600)
	{
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
		countdown --;
		if(countdown <= 0)
		{
			if(!collision_line(x,y,oPlayer.x,oPlayer.y,oWall, false, false))
			countdown = countdownrate;
			recoil= 5;
			//bullet code here
			with (instance_create_layer(x,y,"bullets", oEBullet2))
	{
	speed = 10;
	direction = other.image_angle + random_range(-6,6);
	image_angle = direction;
	}
		}
	}
	
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);