extends MeshInstance3D

signal fwdVecUpdated(new_fwd_vec: Vector3)

var velocityVec: Vector3 = Vector3(0.0,0.0,0.0)

var vectorMesh: ImmediateMesh = ImmediateMesh.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.mesh = vectorMesh
	var material := StandardMaterial3D.new()
	material.albedo_color = Color.BLUE
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	self.material_override = material


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	emit_signal("fwdVecUpdated", velocityVec)
	
	vectorMesh.clear_surfaces()
	vectorMesh.surface_begin(Mesh.PRIMITIVE_LINES)
	
	var start: Vector3 = get_parent().global_transform.origin
	var end = start + (velocityVec)
	
	vectorMesh.surface_add_vertex(Vector3(0, 0, 0))

	vectorMesh.surface_add_vertex(to_local(end))
	vectorMesh.surface_end()
