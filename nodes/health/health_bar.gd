extends Control

onready var health = $Healthbar
onready var tween = $Tween

func set_max_health(value, current):
	health.max_value = value
	health.value = current

func update_health(value):
	health.value = value
	tween.interpolate_property(health, "value", health.value, value, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
