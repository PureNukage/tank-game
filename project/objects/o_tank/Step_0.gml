var _acceleration = .1
var _top_speed_backwards = 1
var _top_speed = 2

depth = -y 

turret_angle = point_direction(x,y,mouse_x,mouse_y)+270

if keyboard_check(ord("W")) {
	friction = 0
	motion_add(direction, _acceleration)
	speed = min(speed, _top_speed)
} else if keyboard_check(ord("S")) {
	friction = 0
	//motion_add(direction-180,_acceleration*-1)///
	speed = min(speed*-1, _top_speed_backwards*-1)
} else {
	friction = _acceleration	
}

if speed > 0 {
	var _turn_amount = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * (_acceleration+.9)
	direction -= _turn_amount
	image_angle = direction+270
}

if keyboard_check_pressed(vk_space) {
	if muzzle_timer == 0 {
		muzzle_timer = 7
	} else {
		muzzle_timer--
		var _muzzle_x_1 = x + lengthdir_x(16, image_angle)
		var _muzzle_y_1 = y + lengthdir_y(16, image_angle)
		instance_create_layer(_muzzle_x_1+random_range(-4,4),_muzzle_y_1+random_range(-4,4),"Instances",o_muzzleflash)
	}
	instance_create_layer(x+1,y,"Instances",o_tank_shell)	
}
if speed > 0 {
	var _dust_x_1 = x + lengthdir_x(16, image_angle+180)
	var _dust_y_1 = y + lengthdir_y(16, image_angle+180)
	instance_create_layer(_dust_x_1+random_range(-4,4),_dust_y_1+random_range(-4,4),"Instances",o_dust)
	
	var _dust_x_2 = x - lengthdir_x(14, image_angle+180)
	var _dust_y_2 = y - lengthdir_y(14, image_angle+180)
	instance_create_layer(_dust_x_2+random_range(-4,4),_dust_y_2+random_range(-4,4),"Instances",o_dust)
}