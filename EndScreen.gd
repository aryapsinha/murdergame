extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$LabelVis/Label.show()
	$LabelVis/YouLose.hide()
	$LabelVis/Reason.hide() # Replace with function body.
	print("read")
	#$People.gameover.connect("_on_people_gameover")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_people_gameover():
	print("okayok")
	$LabelVis/YouLose.visible = true
	$LabelVis/Reason.show()
	$HUDCam.make_current()
	 # Replace with function body.
