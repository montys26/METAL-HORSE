hsp = 4;    
vsp = 4;    
walksp = 4; 

hp = 4;
flash = 0;
hitfrom=0;
hasweapon = true;

if (hasweapon)
{
	mygun = instance_create_layer(x,y,"Gun",oEgun3)
	with (mygun)
	{
		owner = other.id
	}
	
	
}
else mygun = noone;