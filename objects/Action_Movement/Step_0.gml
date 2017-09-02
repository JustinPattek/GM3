if(image_alpha < 1){
	image_alpha += .03;
}
if(image_angle > 0){
image_angle -= 2;
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

key_down = keyboard_check(ord("S"));
if(key_down && place_meeting(x,y,oPlayer))
{
instance_destroy();
instance_create_depth(oMenu.x,oMenu.y, -1, oMenu_Action_Movement);
}