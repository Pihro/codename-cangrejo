if integrity <= 0 {
	instance_create_layer(x, y, "Instances", obj_sandpile)
	instance_deactivate_object(self);
	//instance_destroy(self, false)
}
if(collision_circle(x,y, 12, obj_player, false, false)) {
	if obj_player.kSpace && invincible = false {
		if haveSound == true {
			audio_play_sound(choose(sou_sand1,sou_sand2),1,0);
		}
		integrity -= 1;
		invincible = true;
		alarm[0] = room_speed;
		//show_debug_message("attack")
	}
}
