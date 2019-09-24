switch(handshake)
{
	case 0:
		if handshake_sent != packet and (packet - handshake_sent) > 10 {
			mid0_nw_handshake_request(packet)
			//show_message("network - mid0 sent")
			handshake_sent = packet
			packet++
		} else packet++
	break;
	case 1:
		if handshake_sent != packet and (packet - handshake_sent) > 10 {
			mid2_nw_handshake_established()
			handshake_sent = packet
			packet++
		} else packet++
	break;
	case 2:
		mid5_nw_ping()
	break;
}


