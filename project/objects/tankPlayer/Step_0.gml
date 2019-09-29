// Inherit the parent event
event_inherited()

if hp <= 0 {
	show_message("You died!")
	game_restart()
}

