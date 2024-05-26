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