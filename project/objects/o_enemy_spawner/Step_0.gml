count++

if count == 64 {
	var spawn_pointX = irandom_range(-32,32)
	var spawn_pointY = irandom_range(-32,32)
	instance_create_layer(x+spawn_pointX,y+spawn_pointY,"Instances",o_enemy)
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