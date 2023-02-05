extends KinematicBody2D

var speed = 300
var velocity = Vector2()
var _customDir = false

func init(shouldDestroy = true):
	if shouldDestroy:
		$KillTimer.start()
	else: $KillTimer.stop()
	return self

func _physics_process(delta):
	var dir = Vector2()
	if _customDir: dir = velocity.normalized()
	else: dir = transform.x.normalized()
	var collision_info = move_and_collide(dir * delta * speed)
	if collision_info:
		queue_free()
		
func changeDirection(vec):
	velocity = vec
	_customDir = true

func _on_KillTimer_timeout():
	queue_free()
