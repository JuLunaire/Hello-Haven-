extends Control

@onready var label = $Label
@onready var End = $"You Win!"
# Called when the node enters the scene tree for the first time.
func _ready():
	EventController.connect("Strawberry_collected", on_event_Strawberry_collected)
	End.hide()

func on_event_Strawberry_collected(value:int) -> void:
		label.text = str(value)
		if value == 8:
			End.show()
	
