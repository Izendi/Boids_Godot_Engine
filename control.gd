extends Control

signal data_submitted(strData: String)

@onready var strDataInput: LineEdit = $LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.pressed.connect(_on_submit_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_submit_button_pressed():
	var name_text: String = strDataInput.text
	emit_signal("data_submitted", name_text) # parameter 2 is the data to send with the signal
