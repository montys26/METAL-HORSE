// oGun Step Event (or equivalent)

// Positioning and recoil management
x = owner.x;
y = owner.y + 10;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

recoil = max(0, recoil - 1);

// Check if the player exists and is within range
if (instance_exists(oPlayer)) {
    if (point_distance(oPlayer.x, oPlayer.y, x, y) < 600) {
        image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
        countdown--;

        if (countdown <= 0) {
            if (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false)) {
                // Handle burst firing
                if (burstTimer <= 0) {
                    // Fire a bullet
                    with (instance_create_layer(x, y, "bullets", oEBullet4)) {
                        speed = 6;
                        direction = other.image_angle + random_range(-20, 20);
                        image_angle = direction;
                    }

                    // Update burst state
                    burstCount++;
                    burstTimer = burstDelay; // Reset burst delay

                    // Check if the burst is complete
                    if (burstCount >= burstTotal) {
                        countdown = countdownrate; // Reset the countdown after a full burst
                        burstCount = 0; // Reset the burst count
                    }
                } else {
                    // Decrease the burst timer
                    burstTimer--;
                }

                recoil = 5;
            }
        }
    }
}

// Apply recoil to position
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);