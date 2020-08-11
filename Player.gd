extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	play();	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("ui_right"):
		self.flip_h = false
	if Input.is_action_pressed("ui_left"):
		self.flip_h = true
	if((!Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left")) || (Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"))):
		set_animation('idle')
	else:
		set_animation('walk')
	pass
