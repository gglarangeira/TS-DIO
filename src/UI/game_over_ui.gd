class_name GameOverUI

extends CanvasLayer

@onready var time_label: Label = %TimeLabel
@onready var monsters_label: Label = %MonstersLabel

@export var restart_delay: float = 5.0

var restart_cooldown: float

func _ready():
	time_label.text = GameManager.time_elapsed_string
	monsters_label.text = str(GameManager.monsters_defeated_counter)
	restart_cooldown = restart_delay
	
func _process(delta):
	restart_delay -= delta
	if restart_cooldown <= 0.0:
		restart_game()
	
func restart_game():
	if GameManager.is_game_over: return
	GameManager.end_game()
	get_tree().reload_current_scene()
	GameManager.reset()
