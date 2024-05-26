flash = 4;
hp = hp - 0.5;
if(hp = 0){

with(oGun) instance_destroy();
instance_change(oPDead, true);
with (other) instance_destroy();
}

//double damage