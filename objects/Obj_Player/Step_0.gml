key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);

move = key_right - key_left; // Rightward movement is positive
hsp = move * walkspeed;

if (vsp < 10) vsp += grv; // Upward motion is negative vertical speed

if(place_meeting(x, y+1, Obj_Wall))
{
	vsp = key_jump * -jumpspeed;
}


if (place_meeting(x+hsp, y, Obj_Wall)) // Horizontal Collision
{
	while(!place_meeting(x+sign(hsp), y, Obj_Wall))
	{
		x+= sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x, y+vsp, Obj_Wall)) // Vertical Collision
{
	while(!place_meeting(x, y+sign(vsp), Obj_Wall))
	{
		y+= sign(vsp);
	}
	vsp = 0;
}


x += hsp; // Applying motion to characters
y += vsp;