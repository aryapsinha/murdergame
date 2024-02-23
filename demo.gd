extends Node2D
@onready var enemy_scene = preload("res://people.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	var numPeople = randi() % 4 + 1
	
	for i in numPeople:
		var enemy_scene_copy = enemy_scene.instantiate()
		var x = randi() % 150 + 50
		print(x)
		var y = randi()% 100 - 100
		print(y)
		enemy_scene_copy.position = Vector2(x, y)
		add_child(enemy_scene_copy)
		print("hello")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
