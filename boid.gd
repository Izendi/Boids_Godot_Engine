extends Node3D

@onready var fwv: Vector3 = Vector3(0.0, 0.0, 0.0)

@export var areaName: String

func _physics_process(delta):
	pass
	# var delta_v = fwv * acceleration * delta
	
	#if Input.is_action_pressed("left_mouse_click"):
		#$CharacterBody3D.velocity = fwv
	#else:
		#$CharacterBody3D.velocity = Vector3.ZERO
	#
	#$CharacterBody3D.move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready():
	$CharacterBody3D.get_node("forwardVector").connect("fwdVecUpdated", Callable(self, "_on_fwdVec_updated"))
	$CharacterBody3D.get_node("Area3D").areaName = areaName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_fwdVec_updated(fwdVector: Vector3):
	$CharacterBody3D.velocity = fwdVector
	$CharacterBody3D.move_and_slide()
