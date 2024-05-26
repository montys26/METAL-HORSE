var acceleration = 2; // Adjust as needed
var deceleration = 0.5; // Adjust as needed


// Movement calculation
var horizontal = 0.02;
var vertical = 0.02;



// Acceleration
if (horizontal != 0) {
    hsp += horizontal * acceleration;
} else {
    // Deceleration
    if (hsp != 0) {
        var signHsp = sign(hsp);
        hsp -= signHsp * deceleration;
        if (sign(hsp) != signHsp) {
            hsp = 0;
        }
    }
}

// Vertical movement

if (vertical != 0) {
    vsp += vertical * acceleration;
} else {
    // Deceleration
    if (vsp != 0) {
        var signVsp = sign(vsp);
       vsp -= signVsp * deceleration;
        if (sign(vsp) != signVsp) {
            vsp = 0;
        }
    }
}

//vertical collision
if (place_meeting(x, y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = -vsp;
	//hp = hp-1;
}
if (place_meeting(x, y+vsp,oPlayer))
{
    while (!place_meeting(x,y+sign(vsp),oPlayer))
    {
        y = y + sign(vsp);
    }
    vsp = -vsp * 0.5; // Bounce back vertically
}

if (place_meeting(x+hsp, y,oPlayer))
{
    while (!place_meeting(x+sign(hsp),y,oPlayer))
    {
        x = x + sign(hsp); // Adjust horizontal position
    }
    hsp = -hsp * 0.5; // Bounce back horizontally
}

move_wrap(1,1,5);


// Apply maximum speed limits
var maxSpeed = 5; // Adjust as needed
hsp = clamp(hsp, -maxSpeed, maxSpeed);
vsp = clamp(vsp, -maxSpeed, maxSpeed);



// Apply movement
x += hsp;
y += vsp;
