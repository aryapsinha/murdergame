extends Area2D
@export var enemy_scene: PackedScene
var entered = 0; 
var dir = -1
var attack = false
signal gameover

# Called when the node enters the scene tree for the first time.
func _ready():
	$WalkTime.start() # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += dir * 0.25


func _on_body_entered(body):
	#print("entered")
	
	if(body.name == "Criminal" and attack == true):
		hide()
		$CollisionShape2D.set_deferred("disabled", true)
		get_tree().call_group("Demo", "killed")
		print("ATTACKED!")
	
	elif(body.name == "Criminal" and attack == false):
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
	get_tree().call_group("MainChar", "resetAnimation")
	$WalkTime.start() # Replace with function body.


func on_attack():
	attack = true
	$AttackWindow.start()

func _on_attack_window_timeout():
	attack = false # Replace with function body.
