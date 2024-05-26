
function PlayerStateFree(){
// Movement calculation
var acceleration = 0.5;
var deceleration = 0.2;

var horizontal = (key_right - key_left) + gunkickx;
gunkickx = 0;
var vertical = key_down - key_up + gunkicky;
gunkicky= 0

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


//vertical collision
if (place_meeting(x, y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = -vsp *0.7;
}
if (place_meeting(x+hsp, y,oDoor))
{
	while (!place_meeting(x+sign(hsp),y,oDoor))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;
}
if (place_meeting(x, y+vsp,oEnemyA))
{
    while (!place_meeting(x,y+sign(vsp),oEnemyA))
    {
        y = y + sign(vsp);
    }
    vsp = -vsp * 0.5; // Bounce back vertically
}

if (place_meeting(x+hsp, y,oEnemyA))
{
    while (!place_meeting(x+sign(hsp),y,oEnemyA))
    {
        x = x + sign(hsp); // Adjust horizontal position
    }
    hsp = -hsp * 0.5; // Bounce back horizontally
}

if (place_meeting(x, y+vsp,oEnemyB))
{
    while (!place_meeting(x,y+sign(vsp),oEnemyB))
    {
        y = y + sign(vsp);
    }
    vsp = -vsp; // Bounce back vertically
}

if (place_meeting(x+hsp, y,oEnemyB))
{
    while (!place_meeting(x+sign(hsp),y,oEnemyB))
    {
        x = x + sign(hsp); // Adjust horizontal position
    }
    hsp = -hsp; // Bounce back horizontally
}

if (place_meeting(x, y+vsp,oEnemyC))
{
    while (!place_meeting(x,y+sign(vsp),oEnemyC))
    {
        y = y + sign(vsp);
    }
    vsp = -vsp; // Bounce back vertically
}

if (place_meeting(x+hsp, y,oEnemyC))
{
    while (!place_meeting(x+sign(hsp),y,oEnemyC))
    {
        x = x + sign(hsp); // Adjust horizontal position
    }
    hsp = -hsp; // Bounce back horizontally
}



move_wrap(1,1,1);
//vsp = vertical * walksp;

// Apply maximum speed limits
var maxSpeed = 16; // Adjust as needed
hsp = clamp(hsp, -maxSpeed, maxSpeed);
vsp = clamp(vsp, -maxSpeed, maxSpeed);



// Apply movement
x += hsp;
y += vsp;

var animationSpeed = 1; // Base animation speed
var slowdownFactor = 0.000001; // Adjust as needed
var speedupFactor = 1.85;
// Check if left arrow key is pressed
if (keyboard_check(ord("A"))) {
    // Slow down animation
    image_speed = animationSpeed * slowdownFactor;
}
if (keyboard_check(ord("D"))) {
	image_speed = animationSpeed * speedupFactor
}
else {
    // Reset animation speed to normal when left arrow key is released
    image_speed = animationSpeed;
}

//change to roll state



//activate key logic
if (keyboard_check_pressed(vk_shift)){
	
	
//1. check for entity to activate
//2. if there is nothing, or there is something, but it has no script-roll
//3.otherwise, there is something and it has a script! activate!
//4. if the thing we activate is npc, make face toward us

var _activateX = lengthdir_x(10, direction);
var _activateY = lengthdir_y(10, direction);
activate = instance_position(x +_activateX, y + _activateY, pEntity);

if (activate == noone || activate.entityActivateScript == -1)
{
	//remain free if no activate
	state = state
	
}
else{
	//activate entity
	ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
	
	//turn entity
	
	if (activate.entityNPC)
	{
		with (activate)
		{
			direction = point_direction(x, y, other.x, other.y);
			image_index = round(direction/90)
	}
	
}



	
	
	
	
}

}
}