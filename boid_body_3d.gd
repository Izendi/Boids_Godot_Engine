extends CharacterBody3D

@onready var shader_mat := $MeshInstance3D.material_override as ShaderMaterial
@onready var mesh_node := $MeshInstance3D
@onready var surface_color := Vector3(0.5, 0.1, 0.1)
@export var lightDir: Vector3 = Vector3(0.8, 1.0, -0.5)

@onready var vector_mesh = $vectorMesh
@onready var forward_vector_mesh = $ForwardVectorMesh

@export var MouseSphere: Node3D

@export var acceleration: float = 1.0

var forwardVector: Vector3 = Vector3(0.0, 0.0, 0.0)

var isInArea: bool = false

var area3D_Node

var fwv: Vector3 = Vector3(0.0, 0.0, 0.0)

var area_map: Dictionary = {}

signal nearbyBoidDetected

func _on_area_entered(area: Area3D):
	area_map[area.areaName] = area
	isInArea = true
	surface_color = Vector3(1.0, 1.0, 1.0)

func _on_area_exited(area: Area3D):
	area_map.erase(area.areaName)
	if(area_map.is_empty()):
		isInArea = false
		surface_color = Vector3(0.5, 0.1, 0.1)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	area3D_Node = $Area3D
	area3D_Node.connect("on_boid_enter_domain", Callable(self, "_on_area_entered"))
	area3D_Node.connect("on_boid_exit_domain", Callable(self, "_on_area_exited"))
	
	if MouseSphere:
		vector_mesh.MouseSphere = MouseSphere
		forward_vector_mesh.MouseSphere = MouseSphere;
		forward_vector_mesh.connect("fedVecUpdated", Callable(self, "_on_fwdVec_updated"))

func _on_fwdVec_updated(fwdVec: Vector3):
	forwardVector = fwdVec
	print("Got value fwdVec: ", fwdVec)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if(isInArea):
		for value in area_map.values():
			value.get_parent().get_node("forwardVector").velocityVec = fwv
	
	shader_mat.set_shader_parameter("sphere_center", global_transform.origin)
	
	lightDir = lightDir.rotated(Vector3.UP, deg_to_rad(1))
	
	shader_mat.set_shader_parameter("light_dir", lightDir)
	shader_mat.set_shader_parameter("surface_color", surface_color)
	
	fwv = forwardVector
	
	# var delta_v = fwv * acceleration * delta
	
	if Input.is_action_pressed("left_mouse_click"):
		velocity = fwv
	else:
		velocity = Vector3.ZERO
	
	move_and_slide()	
