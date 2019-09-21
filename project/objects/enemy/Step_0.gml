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
if x > tank.x-tank_hitbox and x < tank.x+tank_hitbox and y < tank.y+tank_hitbox and y > tank.y-tank_hitbox {
	if ds_list_find_index(tank.list_enemies,id) == -1 and tank.flash == 0 {
		ds_list_add(tank.list_enemies,id)
	}	
} else {
	if ds_list_find_index(tank.list_enemies,id) != -1 {
		ds_list_delete(tank.list_enemies,ds_list_find_index(tank.list_enemies,id))
	}		
}

image_angle = point_direction(x,y,tank.x,tank.y)

mp_potential_step_object(tank.x,tank.y,1,enemy)

if instance_place(x,y,explosion) {
	var _explosion = instance_place(x,y,explosion)
	if _explosion.image_index < 5 {
		instance_destroy()
		var dead_body = instance_create_layer(x,y,"Instances",enemyDead)
		dead_body.image_angle = point_direction(x,y,explosion.x,explosion.y+20)
		//image_xscale = distance_to_object(explosion)
	}
}

depth = -y