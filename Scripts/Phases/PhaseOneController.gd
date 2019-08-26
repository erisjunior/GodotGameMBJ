extends Node2D

func _ready() -> void:
	$GUI_Handler/GUI/Counters/Coins/Coins_Patch/Number.text = str(PlayerVariables.coins)+"/10"
	$GUI_Handler/GUI/Counters/HP/HP_Patch/Number.text = str(PlayerVariables.lifes)

func _on_Coin_collected() -> void:
	PlayerVariables.coins += 1
	$GUI_Handler/GUI/Counters/Coins/Coins_Patch/Number.text = str(PlayerVariables.coins)+"/10"
