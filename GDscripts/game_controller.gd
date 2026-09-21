extends Node

var total_strawberries: int = 0
var Border_cross: int = 0

func Strawberry_collected(value:int):
	total_strawberries += value
	EventController.emit_signal("Strawberry_collected", total_strawberries)
	
func Border_crossed(value:int):
	Border_cross += value
	EventController.emit_signal("Border_Crossed", Border_cross)
		
