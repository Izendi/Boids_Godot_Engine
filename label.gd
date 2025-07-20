extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var controlNode = get_parent()
	controlNode.connect("data_submitted", Callable(self, "_on_control_button_pressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_button_pressed(message: String):
	text = message
