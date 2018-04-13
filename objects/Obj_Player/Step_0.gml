//Get Player Input
key_left = keyboard_check (vk_left);
key_right = keyboard_check (vk_right);
key_jump = keyboard_check_pressed (vk_space);

//Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;


if (key_jump) // If jump key pressed, jump
{
	vsp = -7;
}	

if (place_meeting(x+hsp, y, Obj_Wall)) // Horizontal collision, if the player is about to walk into a wall
{	
	hsp = 0;	
}
else
{
	x = x + hsp;
}

if (place_meeting(x, y+vsp, Obj_Wall)) // Vertical collision
{	
	vsp = 0;	
}
else
{
	y = y + vsp;
}

// If vertical is < 0 (a.k.a) you're going upwards
// We want spr_PlayerA with index 0
if (vsp < 0)
{
	sprite_index = spr_PlayerA;
	image_index = 0;
	image_speed = 0;
}

// If vertical is > 0 (a.k.a) you're going downwards
// We want spr_PlayerA with index 1
if (vsp < 0)
{
	sprite_index = spr_PlayerA;
	image_index = 1;
	image_speed = 0;
}

if (vsp == 0)
{
	sprite_index = spr_Player;
	image_index = 0;
}