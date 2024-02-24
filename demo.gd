extends Node2D
@onready var enemy_scene = preload("res://people.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	#$SubViewportContainer/EndScreen/LabelVis/Label.show()
	#$SubViewportContainer/EndScreen._on_people_gameover()
	
	var numPeople = randi() % 4 + 1
	$Criminal/MainCam.make_current() #Change this if a start scene is added
	for i in numPeople:
		var enemy_scene_copy = enemy_scene.instantiate()
		var x = randi() % 150 + 350
		print(x)
		var y = randi()% 100 + 175
		print(y)
		enemy_scene_copy.position = Vector2(x, y)
		#var hud = $EndScreen.new()
		#enemy_scene_copy.connect("gameover", hud._on_people_gameover())
		add_child(enemy_scene_copy)
		print("hello")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

