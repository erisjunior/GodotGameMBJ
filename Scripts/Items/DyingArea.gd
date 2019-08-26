extends Area2D

func _on_DyingArea_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		PlayerVariables.lifes -= 1
		get_tree().change_scene('res://Scenes/Phases/GameOver.tscn')
