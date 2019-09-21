key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))

cursor_x = mouse_x
cursor_y = mouse_y

mouse_left_pressed = mouse_check_button_pressed(mb_left)

horizontal_input = (key_right-key_left)
vertical_input = (key_up-key_down)