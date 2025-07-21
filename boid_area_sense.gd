extends Area3D

var areaName: String

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", changeColor)

func changeColor() -> void:
	print("another node has entered my DOMAIN!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	pass # Replace with function body.
