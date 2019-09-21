var _acceleration = .1
var _top_speed = 4

depth = -y 

turret_angle = point_direction(x,y,input_handler.cursor_x,input_handler.cursor_y)

if input_handler.key_up {
	motion_add(image_angle,1.5)
} else if input_handler.key_down {
	motion_add(image_angle+180,1)
} else {
	friction = _acceleration
}

speed = clamp(speed,0,_top_speed)

if speed != 0 {
	var _turn_amount = (((input_handler.key_right) - (input_handler.key_left))) * (_acceleration+1.9)
	direction -= _turn_amount
	body_angle -= _turn_amount
	image_angle = body_angle+270
}

if ds_list_size(list_enemies) >= 5 and flash == 0 {
	hp -= 25
	ds_list_clear(list_enemies)
	flash = 25
}

if flash flash--

//Shooting
var _v = 8; //bullet speed
var _v2 = _v * _v; 
var _g = 0.2;  //strength of gravity

var _x = point_distance(x,y,input_handler.cursor_x,input_handler.cursor_y);
var _z = target_height - z; //if target and shooter can be at different heights
var _a = _v2 * _v2 - _g * (_g * _x * _x + 2 * _z * _v2);
if (_a > 0) {
	var _b = (_v2 - sqrt(_a) ) / ( _g * _x)
	// { var _b = (_v2 + sqrt(_a) ) / ( _g * _x); }
	var _c = 1 / _b;
	var _m = sign(_b) * _v / sqrt(1 + _c * _c);
        
	var _vsp = 1 * _m;  //initial vertical speed of arrow
	var _hsp = _c * _m;  //initial horizontal speed of arrow
	
	if shooting_timer > 0 shooting_timer--
        
	//fire an arrow
	if input_handler.mouse_left_pressed and shooting_timer == 0 {
	    with instance_create_layer(x,y,"Instances",mortarRound) {
	        direction = point_direction(x,y,other.input_handler.cursor_x,other.input_handler.cursor_y)
	        speed = _hsp;
	        zspeed = _vsp;
	        z_gravity = -_g;
	        z = other.z;
	    }
		shooting_timer = 25
		friction = 0
		motion_add(turret_angle,-2)
	}
	
	target_out_of_range = false 
	
} else {	//target out of range
	target_out_of_range = true
}
		
		
if speed > 0 {
	var _dust_x_1 = x + lengthdir_x(16, image_angle+90) //16
	var _dust_y_1 = y + lengthdir_y(16, image_angle+90)
	instance_create_layer(_dust_x_1+random_range(-4,4),_dust_y_1+random_range(-4,4),"Instances",dust)
	
	var _dust_x_2 = x - lengthdir_x(16, image_angle+90)
	var _dust_y_2 = y - lengthdir_y(16, image_angle+90)
	instance_create_layer(_dust_x_2+random_range(-4,4),_dust_y_2+random_range(-4,4),"Instances",dust)
}

x = clamp(x, 0, room_width)
y = clamp(y, 0, room_height)
