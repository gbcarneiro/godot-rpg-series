extends KinematicBody2D

const ACCELERATION = 200 
const MAX_SPEED = 80 
const FRICTION = 180 

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_raw_strength("ui_up")
	
	input_vector = input_vector.normalized()  # making the diagonal velocity is the same of the others 
	
	
	#if we have somethind that depends of the framerate, we need to multiply this value to delta
	if input_vector != Vector2.ZERO:  
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta) 
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
