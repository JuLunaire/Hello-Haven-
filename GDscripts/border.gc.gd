extends Node2D

@export var value: int = 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
		GameController.Border_crossed(value)
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		GameController.Border_crossed(value*-1)
