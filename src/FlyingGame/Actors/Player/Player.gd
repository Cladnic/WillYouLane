extends KinematicBody2D

export var projectile: PackedScene

var speed = 200 

# Called when the node enters the scene tree for the first time.
func _ready():
	position += Vector2(0.0, 0.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += Vector2(10,0) * delta
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-1,0) * delta * speed
		transform.x = Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		position += Vector2(1,0) * delta * speed 
		transform.x = Vector2(1.0,0)
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0,1) * delta * speed
	if Input.is_action_pressed("ui_up"):
		position += Vector2(0,-1) * delta * speed
	if Input.is_action_just_pressed("ui_select"):
		shoot()

func shoot():
	# Instantiate a projectile and set its direction
	var proj = projectile.instance()
	proj.set_shoot_direction(transform.x)
	
	# Spawn the projectile object, and set the position
	self.get_parent().add_child(proj)
	proj.transform = $Player.global_transform
