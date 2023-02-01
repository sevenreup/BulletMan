extends KinematicBody2D


var velocity = Vector2(1, 0)
var speed = 300

func init(shouldDestroy = true):
	if shouldDestroy:
		$KillTimer.start()
	else: $KillTimer.stop()
	return self

func _physics_process(delta):
	move_and_collide(velocity.normalized() * delta * speed)

func _on_KillTimer_timeout():
	queue_free()
