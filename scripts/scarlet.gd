extends Control

@onready var enter_here=$Panel/EnterHere
@onready var success_message=$Panel/SuccessMessage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_submit_button_pressed() -> void:
	var text = enter_here.text
	text = text.strip_edges().to_lower()
	
	if text == "scarlet":
		success_message.text = "You WIN"
	else:
		success_message.text = "try again"
		
