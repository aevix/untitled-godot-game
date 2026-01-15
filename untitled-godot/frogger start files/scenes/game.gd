extends Node2D

var car_scene: PackedScene = preload("res://scenes/car_scene.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	print('character entered the area')


func _on_timer_timeout() -> void:
	var car = car_scene.instantiate() as Node2D
	var car_position = $car_start_position.get_children().pick_random() as Node2D
	car.position = car_position.position
	$objects.add_child(car)
	car.get_child(0).connect("body_entered", go_to_title)

func go_to_title(body):
	print(body)
	print('player died')	
