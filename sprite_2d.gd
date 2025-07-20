extends Sprite2D

var isBlue: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isBlue:
		modulate = Color(1, 0, 0);
	else:
		modulate = Color(0, 0, 1);

# SIGANL FUNC - Whenever button is pushed
func _on_button_pressed():
	print("THIS IS SPRITE 2D: button was pressed!!!")
	isBlue = !isBlue
