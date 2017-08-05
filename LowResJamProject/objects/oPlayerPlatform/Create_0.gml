surface_resize(application_surface, display_get_width(), display_get_height());
//maquinas de estado
enum PlayerMovent {
	Idle		= 0,
	Moving		= 1
}

enum PlayerState {
	onGround	= 0,
	onAir		= 1
}

//Estados
State = PlayerMovent.Idle
OnAir = PlayerState.onGround

//Controles
Input[0] = vk_left
Input[1] = vk_right
Input[2] = vk_up


//movimiento  horizontal 
#macro HSpeedMax	1
#macro HFricGround	1
#macro HFricAir		1
#macro HAccel		1
HSpeed = 0
HFric  = 1
HDir = 0
HControl = 0

//movimiento  vertical 
#macro VFric		1
#macro VAccel		1
#macro JumpForce	7
#macro MaxVSpeed	3
VSpeed = 0
VDir = 1