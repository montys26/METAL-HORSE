if(place_meeting(x,y,oPlayer)) && (image_index != 0)
{
	speed = 0;
	instance_change(oHitSpark2, true);
}
// collision with player bullet
if(place_meeting(x,y,oBullet)) && (image_index != 0)
{
	speed = 0;
	instance_change(oHitSpark2, true);
}

