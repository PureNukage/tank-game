if image_xscale > 0 {
	image_xscale -= 0.05
	image_yscale -= 0.05
	y -= 1
} else {
	instance_destroy()	
}

depth = -y