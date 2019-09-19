count++
if count == 32 {
	frame_current++	
	if frame_current == 2 {
		frame_current = 0
	}	
	sprite_index = frame[frame_current]
	count = 0
}

image_angle = point_direction(x,y,o_tank.x,o_tank.y)

mp_potential_step_object(o_tank.x,o_tank.y,1,o_enemy)

if instance_place(x,y,o_explosion) {
	var _explosion = instance_place(x,y,o_explosion)
	if _explosion.image_index < 5 {
		instance_destroy()
		instance_create_layer(x,y,"Instances",o_enemy_dead)
	}
}

depth = -y