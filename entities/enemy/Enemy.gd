extends GameEntity

const bullet_scene = preload("res://entities/bullet/bullet.tscn")
onready var shoot_timer = $ShootTimer
onready var rotater = $Rotater
onready var healthbar = $Healthbar

const rotate_speed = 50
const shoot_timer_wait_time = 0.2
const spawn_point_count = 6
const radius = 100

func _ready():	
	var step = 2 * PI / spawn_point_count
	healthbar.set_max_health(max_health, current_health)
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()


func _process(delta):
	var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	rotater.rotation_degrees = fmod(new_rotation, 360)
	

func _on_ShootTimer_timeout() -> void:
	for s in rotater.get_children():
		var bullet = bullet_scene.instance().init(true)
		get_parent().add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation	
		

func _on_entity_health_changed(old_value, new_value):
	healthbar.update_health(new_value)
	
