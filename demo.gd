extends Node2D
@onready var enemy_scene = preload("res://people.tscn")
@onready var camera_scene = preload("res://camera.tscn")
@onready var timeLabel = $Criminal/Timer/TimeLabel
@onready var timer = $Criminal/Timer/Timer
@onready var killcount = 0
var numPeople = 0
@onready var objectives = 0
var numCamera = 0
@onready var disabcamera = 0
var peoplePlaces = [Vector2(625, 325), Vector2(975, 230), Vector2(950, 515), Vector2(805, 625), 
Vector2(645, 545), Vector2(550, 635), Vector2(330, 625), Vector2(1160, 580), Vector2(1275, 625), Vector2(1312, 300)]
var objectPlaces = [Vector2(625, 325), Vector2(975, 230), Vector2(950, 515), Vector2(805, 625), 
Vector2(645, 545), Vector2(550, 635), Vector2(330, 625), Vector2(1160, 580), Vector2(1275, 625), Vector2(1312, 300), Vector2(1475, 470), 
Vector2(1325, 235), Vector2(1395, 565), Vector2(1160, 650), Vector2(730, 485), Vector2(360, 560),
Vector2(1045, 350), Vector2(950, 180), Vector2(500, 175)]# Called when the node enters the scene tree for the first time.
func _ready():
	$StartScreen.show()
	$EndScreen.hide()
	$Criminal.hide()
	$Level0.hide()
	 # Replace with function body.
	#$SubViewportContainer/EndScreen/LabelVis/Label.show()
	#$SubViewportContainer/EndScreen._on_people_gameover()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeLabel.text = "%02d:%02d" % three_min()
	if(objectives == 3 and $Criminal.position == Vector2(936, 677)):
		win()

func three_min():
	var time_left = timer.time_left
	var minute = floor(time_left /60)
	var second = int(time_left) % 60 
	return [minute, second]

func win(): 
	$WinScreen.show()

func killed():
	killcount = killcount + 1
	print(killcount)
	if(killcount == numPeople):
		print("truth")
		get_tree().call_group("MainChar", "killAll")
func disabled():
	disabcamera = disabcamera + 1
	if(disabcamera == numCamera):
		print("cameraTruth")
		get_tree().call_group("MainChar", "disableAll")
func _on_timer_timeout():
	$Criminal.hide()
	get_tree().call_group("HUD", "_on_people_gameover") 

func game_start():
	$Criminal.show()
	$WinScreen.hide()
	$Level0.show()
	$People/CollisionShape2D.set_deferred("disabled", false)
	var white = Color(255, 255, 255, 1)
	$Criminal/Notes/PeopleLabel.set("theme_override_colors/font_color", white)
	$Criminal/Notes/KnifeLabel.set("theme_override_colors/font_color", white)
	$Criminal/Notes/CameraLabel.set("theme_override_colors/font_color", white)
	objectives = 0
	killcount = 0
	disabcamera = 0 
	timeLabel.show()
	timer.start()
	$Criminal.position = Vector2(936, 677)
	$Criminal/AnimatedSprite2D.animation = "walk"
	numPeople = randi() % 4 + 1
	#print(numPeople)
	numCamera = randi() % 3 + 1
	$Criminal/MainCam.make_current() #Change this if a start scene is added
	for i in numPeople:
		var enemy_scene_copy = enemy_scene.instantiate()
		#var x = randi() % peoplePlaces.size()
		#print(x)
		#var y = randi()% 100 + 175
		#print(y)
		enemy_scene_copy.position = peoplePlaces.pick_random()
		#var hud = $EndScreen.new()
		#enemy_scene_copy.connect("gameover", hud._on_people_gameover())
		add_child(enemy_scene_copy)
		#print("hello")
	for i in numCamera:
		var camera_scene_copy = camera_scene.instantiate()
		#var x = randi()%170 + 30 
		#var y = randi()%120 + 170
		camera_scene_copy.position = objectPlaces.pick_random()
		add_child(camera_scene_copy)
	$Weapon.position = objectPlaces.pick_random()
	print(numCamera)


func _on_start_pressed():
	$StartScreen.hide()
	game_start() # Replace with function body.


func _on_try_again_pressed():
	$EndScreen.hide()
	game_start() # Replace with function body.


func _on_play_again_pressed():
	$WinScreen.hide()
	get_tree().call_group("People", "reset")
	get_tree().call_group("Camera", "reset")
	game_start() # Replace with function body.
