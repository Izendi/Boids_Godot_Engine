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
func _physics_process(delta):
	vectorMesh.clear_surfaces()
	vectorMesh.surface_begin(Mesh.PRIMITIVE_LINES) # Begin recording vectors that will make up the line/lines
	
	MouseSphere_world_pos = MouseSphere.global_transform.origin
	
	var start: Vector3 = get_parent().global_transform.origin
	var end = start + (MouseSphere_world_pos.normalized() * 1.0) # 3 units forward in local space
	
	vectorMesh.surface_add_vertex(start)
	vectorMesh.surface_add_vertex(end)
	
	vectorMesh.surface_end()
	self.mesh = vectorMesh
	
	
