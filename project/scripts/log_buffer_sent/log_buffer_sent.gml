var _argument = 0
for(var i=0;i<argument_count;i++) {
	_argument[i] = argument[i]	
}

var _string = ""

switch(_argument[0])
{
	case 0:
	case 2:
	case 4:
	case 7:
		_string += "network" 
	break;
	case 1:
	case 3:
	case 5:
	case 8:
		_string += "server" 
	break;
}

_string += " - " 

_string += "sent "  + script_get_name(_argument[0]+2)

ds_list_add(debug.log,_string)