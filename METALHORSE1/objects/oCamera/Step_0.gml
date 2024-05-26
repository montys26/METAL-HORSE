//update camera

//Update Destination

if (instance_exists(follow))
{
	xTo = follow.x
	yTo = follow.y
	
}

// Update object Position 
x +=  (xTo - x) / 25;
y +=  (yTo - y) / 25;


//keep camera centered
x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

//screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

//update camera view

camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

//paralax
if(layer_exists("BG"))
{
	layer_x("BG",x/1.5); // do not animate this one
}

if(layer_exists("MG"))
{
	layer_x("MG",x *0.5);//if background wants to be scrolling make looping animation on sprite not in code (procreate)
}


