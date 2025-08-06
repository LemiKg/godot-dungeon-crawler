class_name Walk extends State

func physics_update(_delta: float) -> void:
	player.move()
	#print_debug("Move state")

	if player.input_direction.length() < 0.01:
		state_machine.change_state("Idle")
