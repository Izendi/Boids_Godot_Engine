extends Node3D

@export var mouseSphere: Node3D
@export var camera: Camera3D
@export var plane_yz: Plane = Plane(Vector3.RIGHT, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	# pause execution _ready() until the next frame, by which time all _ready() functions in the entire scene tree have definitely finished.
	await get_tree().process_frame
	
	#Define the plane:
	# var plane_yz = Plane(Vector3.RIGHT, 0.0)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("left_mouse_click"):
		var mouse_pos = get_viewport().get_mouse_position()
		
		# vector from world orgin to ray mouse clik position on near clipping plane 
		var ray_origin = camera.project_ray_origin(mouse_pos)
		
		# vector from world origin that if postioned from the camera would be a normal vector going through the point specified via project_ray_origin
		var ray_dir = camera.project_ray_normal(mouse_pos)
		
		#intersects ray takes origin and dir and return where this ray intersects the defined plane_yz varaible
		var intersectionPoint = plane_yz.intersects_ray(ray_origin, ray_origin + ray_dir  * 1000.0)
		
		if intersectionPoint != null:
			mouseSphere.global_position = intersectionPoint
