count++

if count == 64 {
	if instance_nearest(x,y,o_enemy) {
		instance_create_layer(x+64,y+32,"Instances",o_enemy)
	} else {
		instance_create_layer(x,y,"Instances",o_enemy)
	}
	count = 0
}