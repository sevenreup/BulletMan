extends Node

const bulletPath = preload("res://scenes/Bullet.tscn")


func fire(point = self):
	var bullte = bulletPath.instance()
	get_parent().add_child(bullte)
	bullte.position = $Gun.global_position
	pass

func _physics_process(delta):
	pass
