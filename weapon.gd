extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Criminal":
		$CollisionShape2D.set_deferred("disabled", true)
		hide()
		get_tree().call_group("MainChar", "weapon")# Replace with function body.
