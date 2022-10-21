extends AnimatedSprite
var shuriken = preload("res://src/FlyingGame/Objects/MovingObjects/Shuriken.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 200 

# Called when the node enters the scene tree for the first time.
func _ready():
	position += Vector2(0.05,0.05)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(10,0) * delta
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-1,0) * delta * speed 
	if Input.is_action_pressed("ui_right"):
		position += Vector2(1,0) * delta * speed 
	if Input.is_action_pressed("ui_down"):
		position += Vector2(0,1) * delta * speed 
	if Input.is_action_pressed("ui_up"):
		position += Vector2(0,-1) * delta * speed 
	if Input.is_action_just_pressed("ui_select"):
			var shuriken_i = shuriken.instance()
			shuriken_i.shoot(global_position,500) 
			var level_root = get_parent().get_parent()
			level_root.add_child(shuriken_i)

