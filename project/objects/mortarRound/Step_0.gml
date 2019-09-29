depth = -y

if z <= 0 {
	instance_destroy()	
	var _explosion = instance_create_layer(x,y,"Instances",explosion)
	_explosion.ID = ID
}

zspeed += z_gravity;
z += zspeed;