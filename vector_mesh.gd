extends MeshInstance3D

@export var MouseSphere: Node3D

#@export var MouseSpherePath: NodePath
var MouseSphere_world_pos: Vector3

var vectorMesh: ImmediateMesh = ImmediateMesh.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	#var MouseSphereBody: Node3D = get_node(MouseSpherePath)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	vectorMesh.clear_surfaces()
	vectorMesh.surface_begin(Mesh.PRIMITIVE_LINES) # Begin recording vectors that will make up the line/lines
	
	MouseSphere_world_pos = MouseSphere.global_transform.origin
	
	var start: Vector3 = get_parent().global_transform.origin
	var end = MouseSphere_world_pos - start
	
	var finalPoint = end.normalized()
	
	global_transform.origin = start
	
	vectorMesh.surface_add_vertex(Vector3(0, 0, 0))
	vectorMesh.surface_add_vertex(finalPoint * 3.0)
	
	vectorMesh.surface_end()
	self.mesh = vectorMesh
	
	
