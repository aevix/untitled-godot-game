extends Node2D

var car_scene: PackedScene = preload("res://scenes/car_scene.tscn")

func _process(delta):
	Global.score += delta
	$CanvasLayer/Label.text = $CanvasLayer/Label.text.get_slice(' ',0) + " " + str(int(Global.score))
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	call_deferred("change_scene")


func change_scene():
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_timer_timeout() -> void:
	var car = car_scene.instantiate() as Node2D
	var car_position = $car_start_position.get_children().pick_random() as Node2D
	car.position = car_position.position
	$objects.add_child(car)
	car.get_child(0).connect("body_entered", go_to_title)

func go_to_title(body):
	call_deferred("change_scene")
