extends MeshInstance3D

@export var MouseSphere: Node3D
@export var rotationSpeed: float = 1.0

#@export var MouseSpherePath: NodePath
var MouseSphere_world_pos: Vector3

var vectorMesh: ImmediateMesh = ImmediateMesh.new()

var ForwardVector: Vector3 = Vector3.FORWARD.normalized()

signal fedVecUpdated(new_fwd_vec)

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
	
	if MouseSphere == null:
		return
	
	vectorMesh.clear_surfaces()
	vectorMesh.surface_begin(Mesh.PRIMITIVE_LINES) # Begin recording vectors that will make up the line/lines
	
	MouseSphere_world_pos = MouseSphere.global_transform.origin
	
	var t = delta * rotationSpeed
	
	ForwardVector.x = 0.0
	MouseSphere_world_pos.x = 0.0
	
	ForwardVector = ForwardVector.lerp(MouseSphere_world_pos, 1)
	
	var start: Vector3 = get_parent().global_transform.origin
	var end = start + (ForwardVector) 
	
	var velocityVec: Vector3 = end - start
	emit_signal("fedVecUpdated", velocityVec)
	
	# make sure current object matches parent position:
	global_transform.origin = start
	
	#Pass in Vector3(0, 0, 0) since immediate mesh is local to current node, so if we wnat from the origin, we always pass zero
	vectorMesh.surface_add_vertex(Vector3(0, 0, 0))

	vectorMesh.surface_add_vertex(to_local(end))
	
	vectorMesh.surface_end()
	#self.mesh = vectorMesh
