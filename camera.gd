extends Area2D
@export var camera_scene: PackedScene
var tamper = false
var body1

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.animation = "active" # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if overlaps_body(body1) and tamper == true: 
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
		hide()
		get_tree().call_group("Demo", "disabled")
		tamper = false 
	

func on_disable():
	tamper = true
	#print(tamper)
	#$TamperWindow.start()
	
		
	
	#$AnimatedSprite2D.animation = "disabled" -- do this once i make a disabled animation
	#hide()
func _on_body_entered(body):
	
	body1 = body
	'''
	if tamper == true:
		print("on_disable")
		$CollisionShape2D.set_deferred("disabled", true)
		hide()
		get_tree().call_group("Demo", "disabled")
		#await $TamperWindow.timeout
		#tamper = false
	#if(body.name == "Criminal" and tamper == true):

		 # Replace with function body.
	'''


func _on_tamper_window_timeout():
	tamper = false
	print("tampertimeot") # Replace with function body.
