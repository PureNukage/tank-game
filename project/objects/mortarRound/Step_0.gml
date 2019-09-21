depth = -y

if z <= 0 {
	instance_destroy()	
	instance_create_layer(x,y,"Instances",explosion)
}

zspeed += z_gravity;
z += zspeed;