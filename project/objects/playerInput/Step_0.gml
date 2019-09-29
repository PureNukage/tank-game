key_right = keyboard_check(keybind_right)
key_left = keyboard_check(keybind_left)
key_up = keyboard_check(keybind_up)
key_down = keyboard_check(keybind_down)

cursor_x = mouse_x
cursor_y = mouse_y

mouse_left_pressed = mouse_check_button_pressed(mb_left)

horizontal_input = (key_right-key_left)
vertical_input = (key_up-key_down)

if network.handshake >= 2 {
	mid10_nw_playerInput()
}

