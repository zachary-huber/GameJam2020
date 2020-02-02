extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		body.die()


func _on_Menu_Screen_quit():
	get_tree().quit()


func _on_Menu_Screen_restart():
	get_tree().reload_current_scene()
	print("RESTART_PRESSED")

func _on_Falling_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
	if body.is_in_group("Enemy"):
		body.free_queue()


func _on_Credits_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://GodotCredits.tscn")
	if body.is_in_group("Enemy"):
		body.free_queue()
