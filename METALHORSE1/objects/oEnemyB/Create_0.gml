//buggy

hsp = 4;    
vsp = 4;    
walksp = 4; 

hp = 5;
flash = 0;
hitfrom=0;
hasweapon = true;

if (hasweapon)
{
	mygun = instance_create_layer(x,y,"Enemies",oEgun2)//change to grenade launcher and gun
	with (mygun)
	{
		owner = other.id
	}
	
	
}
else mygun = noone;