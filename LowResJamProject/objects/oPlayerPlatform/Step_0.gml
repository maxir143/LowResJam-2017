//Checar controles
HControl = keyboard_check(Input[1]) - keyboard_check(Input[0]) 
if HControl != 0 {
	if HDir != HControl HSpeed = round(HSpeed/2)
	HDir = HControl 
}

// maquina de estados de movimiento horizontal 
if !State {
	if HControl != 0 State = PlayerMovent.Moving
	if HSpeed > 0 HSpeed -= HFric
	var HMove = HSpeed / HFric
	repeat(HMove) {
		if !place_meeting(x+ HDir * HFric,y,oSolid){
			x += HDir * HFric
		} else {
			HSpeed = 0
		}
	}
} else {
	if !audio_is_playing(sndSteps) audio_play_sound(sndSteps,0,0)
	if HControl != 0 if HSpeed < HSpeedMax HSpeed += HAccel
	var HMove = HSpeed / HFric
	repeat(HMove) {
		if !place_meeting(x+ HDir * HFric,y,oSolid) {
			x += HDir * HFric
		} else {
			State = PlayerMovent.Idle
			if audio_is_playing(sndSteps) audio_stop_sound(sndSteps)
		}
		
	}	
	if HControl = 0 {
		State = PlayerMovent.Idle
		if audio_is_playing(sndSteps) audio_stop_sound(sndSteps)
	} 
} 

// maquina de estados de movimiento vertical
if OnAir {
	if audio_is_playing(sndSteps) audio_stop_sound(sndSteps)
	if VDir == -1 if VSpeed > 0 VSpeed -= VFric else VDir = 1
	if VDir == 1 if VSpeed < MaxVSpeed VSpeed += VAccel
	
	var VMove = VSpeed / VAccel 
	repeat(VMove){
		if !place_meeting(x,y+(VDir*VAccel),oSolid) {
			y += VDir*VAccel
		}else{
			if VDir = -1 {
				VDir = 1 
				VSpeed = 0 
				break;
			} else {  
				OnAir = PlayerState.onGround
			}
		}
	}
} else {
	VSpeed = 0
	if !place_meeting(x,y+VAccel,oSolid) {
		OnAir = PlayerState.onAir
	}
	if keyboard_check_pressed(Input[2]) {
		VSpeed	= JumpForce
		VDir	= -1
		OnAir   = PlayerState.onAir
	}
}