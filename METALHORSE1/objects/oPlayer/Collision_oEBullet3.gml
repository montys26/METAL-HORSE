hp = hp - 2;
flash = 4;
if(hp = 0){

with(oGun) instance_destroy();
instance_change(oPDead, true);
with (other) instance_destroy();
}

//double damage