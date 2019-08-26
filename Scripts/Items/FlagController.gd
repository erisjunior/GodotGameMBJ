extends Area2D

export(String) var nextLevel = null

func _on_Flag_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		if PlayerVariables.coins > 9:
			PlayerVariables.coins = 0
			PlayerVariables.lastPhase = nextLevel
			get_tree().change_scene(nextLevel)
		else: 
			$Text.visible = true

func _on_Flag_body_exited(body: PhysicsBody2D) -> void:
	$Text.visible = false
