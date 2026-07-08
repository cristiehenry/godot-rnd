extends Control

# Per-hexagon settings (change these in the Inspector)
@export var correct_answer: String = "red"
@export var success_color: Color = Color("#FF0000")
@export var solved_text_color: Color = Color("#000000")


@onready var enter_red = $Panel/EnterHere
@onready var success_message = $Panel/SuccessMessage
@onready var prompt_label = $Panel/PromptLabel
@onready var hex_fill = $Panel/HexFill


func _ready() -> void:
	# Initial hexagon state
	hex_fill.color = Color.BLACK

	# Clear message
	success_message.text = ""

	# Center text
	success_message.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	success_message.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


func _on_enter_here_text_submitted(new_text: String) -> void:
	var text = new_text.strip_edges().to_lower()

	if text == correct_answer.to_lower():
		complete_hex()
	else:
		await show_try_again()


func complete_hex() -> void:
	# Hide prompt and input
	enter_red.hide()
	prompt_label.hide()

	# Change hex fill color
	hex_fill.color = success_color

	# Correct answer color
	success_message.label_settings.font_color = solved_text_color

	# Display answer
	success_message.text = correct_answer.to_upper()


func show_try_again() -> void:
	# Hide prompt and input temporarily
	enter_red.hide()
	prompt_label.hide()

	# Try again color
	success_message.label_settings.font_color = Color("#a19e94")

	# Display error
	success_message.text = "Try again"

	# Wait
	await get_tree().create_timer(1.5).timeout

	# Remove message
	success_message.text = ""

	# Restore input
	enter_red.show()
	prompt_label.show()

	# Clear incorrect entry
	enter_red.clear()

	# Refocus input
	enter_red.grab_focus()
