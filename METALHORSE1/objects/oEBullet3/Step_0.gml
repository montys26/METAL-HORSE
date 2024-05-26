//homing



// Check if the player exists
if (instance_exists(oPlayer)) {
    // Get the player's position
    var playerX = oPlayer.x;
    var playerY = oPlayer.y;
    
    // Calculate the direction towards the player
    direction = point_direction(x, y, playerX, playerY);
    
    // Set the bullet's speed and direction
    speed = 6; // Adjust speed as needed
    direction = direction;
}


// Collision with player
if (place_meeting(x, y, oPlayer) && (image_index != 0)) {
    speed = 0;
    instance_change(oHitSpark3, true);
}

if (place_meeting(x, y, oBullet) && (image_index != 0)) {
  hp --;
}


if (hp = 0) {
    speed = 0;
    instance_change(oHitSpark3, true); 
}



