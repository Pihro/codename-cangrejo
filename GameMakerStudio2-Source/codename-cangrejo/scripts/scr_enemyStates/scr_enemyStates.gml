if(state == statesArray[0]){
	#region Idle
	counter +=1;
	
	if(counter >= room_speed *3){
		var change = choose(0,1);
		switch(change){
			case 0: state = statesArray[1];
			show_debug_message("Wander!");
			case 1: counter = 0;
			show_debug_message("Continue Idle!"); break;
		}
	}
	if(collision_circle(x,y, 64, obj_player, false, false)){
		state = statesArray[2];
	}
	#endregion
}
else if(state == statesArray[1]){
	#region Wander
	counter +=1;
	if(counter >= room_speed * 3){
		var change = choose(0,1);
		switch(change){
			case 0: state = statesArray[0];
			show_debug_message("Idle!");
			case 1:
			show_debug_message("Continue Wander!");
				mv_dir = (irandom_range(0,3) * 90);
				counter = 0;
		}
	}
	if(collision_circle(x,y, 64, obj_player, false, false)){
		state = statesArray[2];
	}
	#endregion
}
else if(state == statesArray[2]){
	#region Alert
	
	if(!collision_circle(x,y, 64, obj_player, false, false)){
		state = statesArray[0];
		show_debug_message("Idle from Alert!");
	}
	if( collision_circle(x,y, wallRadius, obj_wall, false, false)){
		show_debug_message("WALL DETECTED!");
		state = statesArray[3];
	}
	if( collision_circle(x,y, 8, obj_player, false, false)){
		with obj_player{
			x=xstart;
			y=ystart;
		}
		state = statesArray[0];
		show_debug_message("Attack!");
	}
	#endregion
}
else if(state = statesArray[3]){
	#region Collision
	if (collision_circle(x,y, wallRadius, obj_wall, false, false)) && (collision_circle(x,y, 64, obj_player, false, false)){
		state = statesArray[3]
	}
	if (!collision_circle(x,y, 64, obj_player, false, false)){
		state = statesArray[1];
	}
	#endregion
}