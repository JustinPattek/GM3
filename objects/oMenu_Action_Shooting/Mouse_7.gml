grab = false;
depth = 0;

if(place_meeting(x,y, oMenu)){
image_alpha = 1;
x = oMenu.x;
y = oMenu.y;
}
else{
instance_destroy();
instance_create_depth(oPlayer.x,oPlayer.y,-1, Action_Shooting);
}