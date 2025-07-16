extends RigidBody3D

@onready var shader_mat := $MeshInstance3D.material_override as ShaderMaterial
@onready var mesh_node := $MeshInstance3D
@export var lightDir: Vector3 = Vector3(0.8, 1.0, -0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	shader_mat.set_shader_parameter("sphere_center", global_transform.origin)
	
	lightDir = lightDir.rotated(Vector3.UP, deg_to_rad(1))
	
	shader_mat.set_shader_parameter("light_dir", lightDir)
