extends Node2D

func _ready() -> void:
	PlayerVariables.lifes = 3
	PlayerVariables.coins = 0

func _on_start_click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene('res://Scenes/Phases/PhaseOne.tscn')


func _on_quit_click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		get_tree().quit()
