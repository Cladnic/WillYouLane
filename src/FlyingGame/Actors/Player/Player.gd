extends KinematicBody2D

export var projectile: PackedScene

var speed = 20000
var velocity := Vector2(0.0, 0.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = get_move_direction()
	set_look_direction(direction)
	velocity = delta * speed * direction
	move_and_slide(velocity)
	if Input.is_action_just_pressed("ui_select"):
		shoot()

func get_move_direction():
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
func set_look_direction(direction: Vector2):
	if direction.x < 0:
		transform.x = Vector2(-1,0)
	elif direction.x > 0:
		transform.x = Vector2(1,0)

func shoot():
	# Instantiate a projectile and set its direction
	var proj = projectile.instance()
	proj.set_shoot_direction(transform.x)
	# Spawn the projectile object, and set the position
	self.get_parent().add_child(proj)
	proj.transform = $Player.global_transform
