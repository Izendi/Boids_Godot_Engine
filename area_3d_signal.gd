extends Area3D

signal on_boid_enter_domain(nearbyArea: Area3D) #declare signal
signal on_boid_exit_domain(nearbyArea: Area3D)

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_boid_enter)
	area_exited.connect(_on_boid_exit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_boid_enter(other_area: Area3D):
	print("BOID ENTERED: ", other_area.name)
	emit_signal("on_boid_enter_domain", other_area)

func _on_boid_exit(other_area: Area3D):
	print("BOID EXITED: ", other_area.name)
	emit_signal("on_boid_exit_domain", other_area)
