extends Control

func _process(delta: float) -> void:
	$Label2.text = $Label2.text.get_slice(': ',0) + ": " + str(int(Global.score))
	if Input.is_action_just_pressed("jump"):
		Global.score = 0
		call_deferred("reload_game")

func reload_game():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
