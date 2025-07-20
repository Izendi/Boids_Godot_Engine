extends Button

signal manual_button_pressed #declare signal

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_pressed) #connect to its own build in pressed signal


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	print("Manual Button was clicked")
