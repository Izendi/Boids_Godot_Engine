extends Sprite2D

var linkedButton

# Called when the node enters the scene tree for the first time.
func _ready():
	linkedButton = get_parent().get_node("Button_manual")
	linkedButton.connect("manual_button_pressed", Callable(self, "_on_manual_button_pressed_signal"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_manual_button_pressed_signal():
	print("Manual button signal received")
