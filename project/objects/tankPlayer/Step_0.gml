// Inherit the parent event
event_inherited()

if hp <= 0 {
	if ID == network.ID {
		show_message("You died!")
		hp = 100
		x = irandom_range(15,room_width-15)
		y = irandom_range(15,room_height-15)
	}
	
}

if instance_place(x,y,explosion) {
	var _explosion = instance_place(x,y,explosion)
	if _explosion.ID != ID  and _explosion.image_index < 6 and instance_exists(server) and flash == 0 {
		mid14_sv_playerDamage(_explosion.ID,ID)
	}
}

if ID == network.ID {
	if packet >= 5 {
		mid12_nw_playerSync(x,y,body_angle,turret_angle,hp)
		packet = 0
	}
	
	packet++
	
}