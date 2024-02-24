extends CharacterBody2D

@export var speed = 200
@export var angular_speed := 5.0
var armed = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0#ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
	var direction := Vector2(
		# This first line calculates the X direction, the vector's first component.
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		# And here, we calculate the Y direction. Note that the Y-axis points 
		# DOWN in games.
		# That is to say, a Y value of `1.0` points downward.
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	# When aiming the joystick diagonally, the direction vector can have a length 
	# greater than 1.0, making the character move faster than our maximum expected
	# speed. When that happens, we limit the vector's length to ensure the player 
	# can't go beyond the maximum speed.
	velocity = speed * direction
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0
	
	if Input.is_action_pressed("kill"):
		if(armed):
			#print("legal")
			get_tree().call_group("People", "on_attack")
			
		#else:
			#print("illegal")
	
	move_and_slide() #necessary to check for the collision at every time
	
	

	
func weapon():
	armed = true
	print("WEAPON")
	var green = Color(0.0,1.0,0.0,1.0)
	$Notes/KnifeLabel.set("theme_override_colors/font_color", green)
