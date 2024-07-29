extends CanvasLayer

@onready var timer_label: Label = %TimerLabel
@onready var meat_label: Label = %MeatLabel

func _ready():
#	GameManager.player.meat_collected.connect(on_meat_collected)
	meat_label.text = str(GameManager.meat_counter)

func _process(delta: float):
	timer_label.text = GameManager.time_elapsed_string

#func on_meat_collected(regeneraton_value: int) -> void:
#	meat_counter += 1
#	meat_label.text = str(meat_counter)
