count++
if count == 32 {
	frame_current++	
	if frame_current == 2 {
		frame_current = 0
	}	
	sprite_index = frame[frame_current]
	count = 0
}

var tank_hitbox = 48
if x > o_tank.x-tank_hitbox and x < o_tank.x+tank_hitbox and y < o_tank.y+tank_hitbox and y > o_tank.y-tank_hitbox {
	if ds_list_find_index(o_tank.list_enemies,id) == -1 and o_tank.flash == 0 {
		ds_list_add(o_tank.list_enemies,id)
	}	
} else {
	if ds_list_find_index(o_tank.list_enemies,id) != -1 {
		ds_list_delete(o_tank.list_enemies,ds_list_find_index(o_tank.list_enemies,id))
	}		
}

image_angle = point_direction(x,y,o_tank.x,o_tank.y)

mp_potential_step_object(o_tank.x,o_tank.y,1,o_enemy)

if instance_place(x,y,o_explosion) {
	var _explosion = instance_place(x,y,o_explosion)
	if _explosion.image_index < 5 {
		instance_destroy()
		var dead_body = instance_create_layer(x,y,"Instances",o_enemy_dead)
		dead_body.image_angle = point_direction(x,y,o_explosion.x,o_explosion.y+20)
		//image_xscale = distance_to_object(explosion)
	}
}

depth = -y