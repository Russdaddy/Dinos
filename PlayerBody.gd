extends KinematicBody2D

export var snap := false
export var move_speed := 250
export var jump_force := 500
export var down_force := 3
export var gravity := 900
export var slope_slide_threshold := 50.0


var velocity := Vector2()

func _physics_process(delta):
	var direction_x := Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction_x * move_speed
	
	if Input.is_action_just_pressed("jump") and snap:
		velocity.y = -jump_force
		snap = false
		
	if(Input.get_action_strength("ui_down") > 0):
		velocity.y += gravity * down_force * delta
	else:
		velocity.y += gravity * delta
	
	var snap_vector = Vector2(0, 32) if snap else Vector2()
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector2.UP, slope_slide_threshold, 4, deg2rad(46))
		
	if is_on_floor() and (Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")):
		velocity.y = 0
	
	var just_landed := is_on_floor() and not snap
	if just_landed:
		snap = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
