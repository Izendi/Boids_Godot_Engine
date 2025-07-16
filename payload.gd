extends Object

class_name Payload

var m_BoidData: BoidDataStruct

#Constructor
func _init(World_Space_Position: Vector3, Direction_Vector: Vector3, Velocity_Speed: float, Acceleration: float):
	m_BoidData = BoidDataStruct.new(World_Space_Position, Direction_Vector, Velocity_Speed, Acceleration)

func setWorldSpacePosition(wsp: Vector3) -> void:
	m_BoidData.world_space_pos = wsp

func setDirectionVector(dv: Vector3) -> void:
	m_BoidData.direction_vector = dv

func setVelocitySpeed(vs: float) -> void:
	m_BoidData.velocity_speed = vs

func setAcceleration(a: float) -> void:
	m_BoidData.acceleration = a

func getWorldSpacePosition() -> Vector3:
	return m_BoidData.world_space_pos

func getDirectionVector() -> Vector3:
	return m_BoidData.direction_vector

func getVelocitySpeed() -> float:
	return m_BoidData.velocity_speed

func getAcceleration() -> float:
	return m_BoidData.acceleration
