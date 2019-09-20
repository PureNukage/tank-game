count++
if count == 5 {
	frame_current++
	if frame_current == 4 {
		sprite_index = frame[5]
		image_index = 0
	} else {
		sprite_index = frame[frame_current]
		count = 0
	}
}
