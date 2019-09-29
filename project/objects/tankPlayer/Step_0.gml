// Inherit the parent event
event_inherited()

if hp <= 0 {
	show_message("You died!")
	game_restart()
}

if instance_place(x,y,explosion) {
	var _explosion = instance_place(x,y,explosion)
	if _explosion.ID != ID  and _explosion.image_index < 6 and instance_exists(server) and flash == 0 {
		mid14_sv_playerDamage(_explosion.ID,ID)
	}
}

