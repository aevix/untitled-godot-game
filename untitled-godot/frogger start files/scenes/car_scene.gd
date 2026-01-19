extends Node2D

var direction = Vector2.LEFT
var speed = 150
var colors = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")
]

func _ready() -> void:
	if position.x < 0:
		direction.x = 1
		$area2d/Sprite2D.flip_h = true
	$area2d/Sprite2D.texture = colors.pick_random()
	
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
