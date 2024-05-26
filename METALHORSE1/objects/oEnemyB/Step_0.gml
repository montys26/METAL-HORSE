// Constants for acceleration and deceleration
var acceleration = 1; // Adjust as needed
var deceleration = 1; // Adjust as needed
var maxSpeed = 5; // Adjust as needed
var pursueDistance = 80; // Distance threshold to start pursuing the player

// Check if the player exists
if (instance_exists(oPlayer)) {
    // Get the player's position
    var playerX = oPlayer.x;
    var playerY = oPlayer.y;

    // Calculate the distance to the player
    var distToPlayer = point_distance(x, y, playerX, playerY);

    // Movement variables
    var horizontal = 0;
    var vertical = 0;

    // Pursue the player if further than the pursueDistance
    if (distToPlayer > pursueDistance) {
        if (playerX > x) {
            horizontal = 1;
        } else if (playerX < x) {
            horizontal = -1;
        }

        if (playerY > y) {
            vertical = 1;
        } else if (playerY < y) {
            vertical = -1;
        }
    }

    // Horizontal acceleration and deceleration
    if (horizontal != 0) {
        hsp += horizontal * acceleration;
    } else if (hsp != 0) {
        var signHsp = sign(hsp);
        hsp -= signHsp * deceleration;
        if (sign(hsp) != signHsp) {
            hsp = 0;
        }
    }

    // Vertical acceleration and deceleration
    if (vertical != 0) {
        vsp += vertical * acceleration;
    } else if (vsp != 0) {
        var signVsp = sign(vsp);
        vsp -= signVsp * deceleration;
        if (sign(vsp) != signVsp) {
            vsp = 0;
        }
    }

    // Vertical collision with walls
    if (place_meeting(x, y + vsp, oWall)) {
        while (!place_meeting(x, y + sign(vsp), oWall)) {
            y += sign(vsp);
        }
        vsp = -vsp; // Invert vertical speed upon collision
    }

   
	 if (place_meeting(x + hsp, y, oEnemyB)) {
        while (!place_meeting(x + sign(hsp), y, oEnemyB)) {
            x += sign(hsp);
        }
        hsp = -hsp * 2; // Bounce back horizontally with reduced speed
    }
   
	 if (place_meeting(x + hsp, y, oEnemyC)) {
        while (!place_meeting(x + sign(hsp), y, oEnemyC)) {
            x += sign(hsp);
        }
        hsp = -hsp * 2; // Bounce back horizontally with reduced speed
    }
		if (place_meeting(x, y+ vsp, oEnemyC)) {
        while (!place_meeting(x, y+ sign(vsp), oEnemyC)) {
            y += sign(vsp);
        }
        vsp = -vsp * 0.5; // Bounce back horizontally with reduced speed
    }

	
	 if (place_meeting(x + hsp, y, oPlayer)) {
        while (!place_meeting(x + sign(hsp), y, oPlayer)) {
            x += sign(hsp);
        }
        hsp = -hsp * 0.5; // Bounce back horizontally with reduced speed
    }
	
	if (place_meeting(x, y+ vsp, oPlayer)) {
        while (!place_meeting(x, y+ sign(vsp), oPlayer)) {
            y += sign(vsp);
        }
        vsp = -vsp * 0.5; // Bounce back horizontally with reduced speed
    }

    // Wrap movement if applicable
    move_wrap(1, 1, 5); // Adjust as needed

    // Apply maximum speed limits
    hsp = clamp(hsp, -maxSpeed, maxSpeed);
    vsp = clamp(vsp, -maxSpeed, maxSpeed);

    // Apply movement
    x += hsp;
    y += vsp;
} else {
    // Decelerate smoothly if player does not exist
    if (hsp != 0) {
        var signHsp = sign(hsp);
        hsp -= signHsp * deceleration;
        if (sign(hsp) != signHsp) {
            hsp = 0;
        }
    }

    if (vsp != 0) {
        var signVsp = sign(vsp);
        vsp -= signVsp * deceleration;
        if (sign(vsp) != signVsp) {
            vsp = 0;
        }
    }

    // Apply maximum speed limits
    hsp = clamp(hsp, -maxSpeed, maxSpeed);
    vsp = clamp(vsp, -maxSpeed, maxSpeed);

    // Apply movement
    x += hsp;
    y += vsp;
}
