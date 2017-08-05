if keyboard_check_pressed(vk_up)	and !place_meeting(x,y-BaseMove,oSolid)	y -= BaseMove

if keyboard_check_pressed(vk_down)	and !place_meeting(x,y+BaseMove,oSolid)	y += BaseMove

if keyboard_check_pressed(vk_left)	and !place_meeting(x-BaseMove,y,oSolid)	x -= BaseMove

if keyboard_check_pressed(vk_right)	and !place_meeting(x+BaseMove,y,oSolid)	x += BaseMove