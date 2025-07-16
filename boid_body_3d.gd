extends CharacterBody3D

@onready var shader_mat := $MeshInstance3D.material_override as ShaderMaterial
@onready var mesh_node := $MeshInstance3D
@export var lightDir: Vector3 = Vector3(0.8, 1.0, -0.5)

@onready var vector_mesh = $vectorMesh
@onready var forward_vector_mesh = $ForwardVectorMesh

@export var MouseSphere: Node3D

@export var acceleration: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if MouseSphere:
		vector_mesh.MouseSphere = MouseSphere
		forward_vector_mesh.MouseSphere = MouseSphere;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	shader_mat.set_shader_parameter("sphere_center", global_transform.origin)
	
	lightDir = lightDir.rotated(Vector3.UP, deg_to_rad(1))
	
	shader_mat.set_shader_parameter("light_dir", lightDir)
	
	var fwv: Vector3 = forward_vector_mesh.ForwardVector
	
	var delta_v = fwv * acceleration * delta
	
	if Input.is_action_pressed("left_mouse_click"):
		velocity = fwv
	else:
		velocity = Vector3.ZERO
	
	move_and_slide()	
