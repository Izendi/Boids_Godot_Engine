extends MeshInstance3D

@export var MouseSphere: Node3D
@export var rotationSpeed: float = 1.0

#@export var MouseSpherePath: NodePath
var MouseSphere_world_pos: Vector3

var vectorMesh: ImmediateMesh = ImmediateMesh.new()

var ForwardVector: Vector3 = Vector3.FORWARD.normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Assign the mesh to this MeshInstance3D
	self.mesh = vectorMesh
	
	# Set material to color the whole line red
	var material := StandardMaterial3D.new()
	material.albedo_color = Color.RED
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	self.material_override = material


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vectorMesh.clear_surfaces()
	vectorMesh.surface_begin(Mesh.PRIMITIVE_LINES) # Begin recording vectors that will make up the line/lines
	
	MouseSphere_world_pos = MouseSphere.global_transform.origin.normalized()
	
	var t = delta * rotationSpeed
	
	ForwardVector.x = 0.0
	MouseSphere_world_pos.x = 0.0
	
	ForwardVector = ForwardVector.slerp(MouseSphere_world_pos, t)
	
	var start: Vector3 = get_parent().global_transform.origin
	var end = start + (ForwardVector * 0.5) # 3 units forward in local space
	
	vectorMesh.surface_add_vertex(start)

	vectorMesh.surface_add_vertex(end)
	
	vectorMesh.surface_end()
	#self.mesh = vectorMesh
