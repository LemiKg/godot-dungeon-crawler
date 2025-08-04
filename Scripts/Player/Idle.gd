extends State

func enter() -> void:
	player.velocity.x = move_toward(player.velocity.x, 0.0, player.speed)
	player.velocity.z = move_toward(player.velocity.z, 0.0, player.speed)
	print_debug("Idle state")
	

func physics_update(delta) -> void:
	if player.input_direction.length() > 0.01:
		state_machine.change_state("walk")
