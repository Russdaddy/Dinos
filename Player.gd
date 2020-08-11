extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	play();
	set_position(Vector2(100,500))	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_RIGHT):
		position += Vector2(150 * delta,0) 
		self.flip_h = false
	if Input.is_key_pressed(KEY_LEFT):
		position += Vector2(-150 * delta,0)
		self.flip_h = true
	if((!Input.is_key_pressed(KEY_LEFT) && !Input.is_key_pressed(KEY_RIGHT)) || (Input.is_key_pressed(KEY_LEFT) && Input.is_key_pressed(KEY_RIGHT))):
		set_animation('idle')
	else:
		set_animation('walk')
	pass
