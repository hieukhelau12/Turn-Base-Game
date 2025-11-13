extends CardState

var player: bool

func enter() -> void:
	card_ui.color.color = Color.DARK_VIOLET
	card_ui.state.text = "RELEASED"
	player = false
	
	if not card_ui.targets.is_empty():
		player = true
		print("play card for target(s): ", card_ui.targets)

func on_input(_event: InputEvent) -> void:
	if player:
		return
	transition_requested.emit(self, CardState.State.BASE)
