count++

if count == 64 {
	if instance_nearest(x,y,o_enemy) {
		instance_create_layer(x+64,y+32,"Instances",o_enemy)
	} else {
		instance_create_layer(x,y,"Instances",o_enemy)
	}
	count = 0
}

image_angle++

if flash > 0 flash--

if (instance_position(x,y,o_explosion) and flash == 0) {
	var _you_already_damaged_me = instance_position(x,y,o_explosion)
	if _you_already_damaged_me != you_already_damaged_me {
		you_already_damaged_me = instance_position(x,y,o_explosion)
		hp -= 10
		flash = 6	
	} else {

	}
}

if hp <= 0 {
	instance_destroy()	
}