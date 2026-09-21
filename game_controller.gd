extends Node

var total_strawberries: int = 0

func Strawberry_collected(value:int):
	total_strawberries += value
	EventController.emit_signal("Strawberry_collected", total_strawberries)
