extends Area2D
@export var enemy_scene: PackedScene
var entered = 0; 
var dir = -1
signal gameover

# Called when the node enters the scene tree for the first time.
func _ready():
	$WalkTime.start() # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dir * 0.25


func _on_body_entered(body):
	#print("entered")
	
	
	if(body.name == "Criminal"):
		body.hide()
		$CollisionShape2D.set_deferred("disabled", true)
		get_tree().call_group("HUD", "_on_people_gameover")
		
		
		#emit game over signal
		#Replace with function body.
	


func _on_body_exited(body):
	pass#print("exited") # Replace with function body.


func _on_walk_time_timeout():
	dir = dir * -1
	$AnimatedSprite2D.flip_h = dir > 0
	$WalkTime.start() # Replace with function body.


