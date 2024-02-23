extends Marker2D
@export var people_spawner: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn(_people_spawner := people_spawner) -> void:
	var spawn := _people_spawner.instance() as Node2D
	
	add_child(spawn)
	
	spawn.set_as_toplevel(true) 
	spawn.global_position = global_position
