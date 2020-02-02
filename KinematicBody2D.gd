extends KinematicBody2D
export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200
var velocity = Vector2()
var jumping = false
func get_input():
	velocity.x = 0;
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	
	if jump and is_on_floor():
		velocity.y=jump_speed
		$AnimationPlayer.play("Jump")
	if right:
		velocity.x += run_speed
		if is_on_floor():
			$AnimationPlayer.play('Walk')
		$Sprite.flip_h = false
	if left:
		velocity.x -= run_speed
		$Sprite.flip_h = true
		$AnimationPlayer.play('Walk')
	if velocity.x == 0 and velocity.y == 0 and is_on_floor():
		$AnimationPlayer.play('Idle')
	if velocity.y > 0 and not is_on_floor():
		$AnimationPlayer.play("Fall")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity,Vector2(0,-1))
