x = oPlayer.x+1.5;
y= oPlayer.y-63;

image_angle = point_direction(x, y, mouse_x, mouse_y);


firingdelay = firingdelay-1;
recoil = max(0, recoil -1 );
if (mouse_check_button_pressed(mb_left)) && (firingdelay < 0)
{
	recoil= 15;
	firingdelay = 17;
	screenshake(8.5,15)
	with (instance_create_layer(x,y,"bullets", oBullet))
	{
	speed = 25;
	direction = other.image_angle + random_range(-3,3);
	image_angle = direction;
	}
	
	with (oPlayer)
	{
		gunkickx = lengthdir_x(1.5, other.image_angle - 180);
		gunkicky = lengthdir_y(1.5, other.image_angle - 180);
		
		
	}
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

