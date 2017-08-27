//Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));

//Get My Available actions
if(instance_exists(oMenu_Action_Movement)){
	can_walk = true;
}
else{
	can_walk = false;
}
if(instance_exists(oMenu_Action_Shooting)){
	can_shoot = true;
}
else{
	can_shoot = false;
}


//Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;

//Horizontal Collision
if(place_meeting(x+hsp,y,oWall))
{
	//sign returns 1 or -1 depending if parameter is positive or negative
	while(!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);	
	}
	hsp = 0;
}

if(can_walk)
{
	x = x + hsp;
}

//Vertical Collision
vsp = vsp + grv;

if(place_meeting(x,y+vsp,oWall))
{
	//sign returns 1 or -1 depending if parameter is positive or negative
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}

y = y + vsp;

//Jumping
if(place_meeting(x,y+2,oWall) && key_jump)
{
	vsp = -7;
}
