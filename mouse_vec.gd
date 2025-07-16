extends Node3D

@export var forward: Vector3


# Called when the node enters the scene tree for the first time.
func _ready():
	forward = -global_transform.basis.z


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called 60 times a second by default (not tied to frame rate)
func _physics_process(delta):
	pass
