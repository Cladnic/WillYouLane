extends Area2D

var direction: Vector2

var velocity = 0
var rot = PI
var speed = 750

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += direction * speed * delta
	$Sprite.rotation += rot * delta

func set_shoot_direction(new_direction):
	self.direction = new_direction
	
