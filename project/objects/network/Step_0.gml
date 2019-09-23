switch(handshake)
{
	case 0:
		mid0_nw_handshake_request(packet)
		packet++
	break;
	case 1:
		mid2_nw_handshake_established()
		packet++
	break;
	case 2:
		mid4_nw_ping()
	break;
}


