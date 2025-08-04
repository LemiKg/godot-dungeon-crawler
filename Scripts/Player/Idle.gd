extends State

@onready var player: Player = get_parent().get_parent()

func physics_update(_delta) -> void:
	player.move()
	player.move_and_slide()
