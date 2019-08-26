extends Node2D

var timeToRestart = 10

func _ready() -> void:
	PlayerVariables.coins = 0
	if PlayerVariables.lifes == 0:
		$Start.visible = false

func _on_start_click(viewport: Node, event: InputEvent, shape_idx: int) -> void:	
	if (event is InputEventMouseButton && event.pressed && PlayerVariables.lifes > 0):
		if PlayerVariables.lastPhase == '':
			get_tree().change_scene('res://Scenes/Phases/PhaseOne.tscn')
		else:
			get_tree().change_scene(PlayerVariables.lastPhase)


func _on_quit_click(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene('res://Scenes/Phases/Start.tscn')


func _on_pass_one_second() -> void:
	timeToRestart -= 1
	$Start/LabelStart.text = "RESTART "+ str(timeToRestart)
	if timeToRestart == 0:
		get_tree().change_scene('res://Scenes/Phases/Start.tscn')
