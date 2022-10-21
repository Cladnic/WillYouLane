extends Sprite


var velocity = 0
var rot = PI
var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(1,0) * delta * speed  
	rotation += rot * delta
	
func shoot(pos,speedv):
	speed = speedv 
	position = pos 
	
