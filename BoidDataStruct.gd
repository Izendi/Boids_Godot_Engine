extends Object

class_name BoidDataStruct

var world_space_pos: Vector3
var direction_vector: Vector3
var velocity_speed: float
var acceleration: float	

#Constructor
func _init(World_Space_Position: Vector3, Direction_Vector: Vector3, Velocity_Speed: float, Acceleration: float):
	world_space_pos = World_Space_Position
	direction_vector = Direction_Vector
	velocity_speed = Velocity_Speed
	acceleration = Acceleration
	
