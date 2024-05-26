x = oPlayer.x+1.5;
y= oPlayer.y-63;

image_angle = point_direction(x, y, mouse_x, mouse_y);


firingdelay = firingdelay-1;
recoil = max(0, recoil -1 );
if (mouse_check_button(mb_left)) && (firingdelay < 0)
{
	recoil= 5;
	firingdelay = 5;
	screenshake(5,15)
	with (instance_create_layer(x,y,"bullets", oEBullet))
	{
	speed = 20;
	direction = other.image_angle + random_range(-6,6);
	image_angle = direction;
	}
		with (oPlayer)
	{
		gunkickx = lengthdir_x(3, other.image_angle - 180);
		gunkicky = lengthdir_y(3, other.image_angle - 180);
		
		
	}

}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

