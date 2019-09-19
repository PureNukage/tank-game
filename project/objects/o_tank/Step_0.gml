var _acceleration = .1
var _top_speed_backwards = 1
var _top_speed = 4

depth = -y 

turret_angle = point_direction(x,y,mouse_x,mouse_y)

if keyboard_check(ord("W")) {
	friction = 0
	speed = min(speed+_acceleration, _top_speed)		//motion_add(direction, _acceleration)
} else if keyboard_check(ord("S")) {
	friction = 0
	speed = min(speed*-1, _top_speed_backwards*-1)
} else {
	friction = _acceleration	
}

if speed > 0 {
	var _turn_amount = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * (_acceleration+1.9)
	direction -= _turn_amount
	image_angle = direction
}

//Shooting
var _v = 8; //bullet speed
var _v2 = _v * _v; 
var _g = 0.2;  //strength of gravity

var _x = point_distance(x,y,mouse_x,mouse_y);
var _z = target_height - z; //if target and shooter can be at different heights
var _a = _v2 * _v2 - _g * (_g * _x * _x + 2 * _z * _v2);
if (_a > 0) {
	var _b = (_v2 - sqrt(_a) ) / ( _g * _x)
	// { var _b = (_v2 + sqrt(_a) ) / ( _g * _x); }
	var _c = 1 / _b;
	var _m = sign(_b) * _v / sqrt(1 + _c * _c);
        
	var _vsp = 1 * _m;  //initial vertical speed of arrow
	var _hsp = _c * _m;  //initial horizontal speed of arrow
        
	//fire an arrow
	if mouse_check_button_pressed(mb_left) {
	    with instance_create_layer(x,y,"Instances",o_tank_shell) {
	        direction = point_direction(x,y,mouse_x,mouse_y);
	        speed = _hsp;
	        zspeed = _vsp;
	        z_gravity = -_g;
	        z = other.z;
	    }
	}
}
		
		
if speed > 0 {
	var _dust_x_1 = x + lengthdir_x(16, image_angle+90) //16
	var _dust_y_1 = y + lengthdir_y(16, image_angle+90)
	instance_create_layer(_dust_x_1+random_range(-4,4),_dust_y_1+random_range(-4,4),"Instances",o_dust)
	
	var _dust_x_2 = x - lengthdir_x(16, image_angle+90)
	var _dust_y_2 = y - lengthdir_y(16, image_angle+90)
	instance_create_layer(_dust_x_2+random_range(-4,4),_dust_y_2+random_range(-4,4),"Instances",o_dust)
}