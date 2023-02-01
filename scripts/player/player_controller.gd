extends GameEntity

var move = load_ability("move")
const bulletPath = preload("res://scenes/bullet/bullet.tscn")

func fire():
	var gunNode = get_current_gun()
	var bullte = bulletPath.instance().init(false)
	get_parent().add_child(bullte)
	bullte.position = gunNode.global_position
	bullte.velocity = direction
	pass
	
func _read_input():
	if Input.is_action_pressed("move_up"): move.execute(self,"up")
	if Input.is_action_pressed("move_down"): move.execute(self,"down")
	if Input.is_action_pressed("move_left"): move.execute(self,"left")
	if Input.is_action_pressed("move_right"): move.execute(self,"right")
	
	if Input.is_action_just_pressed("primary_attack"): fire()
	if Input.is_action_just_pressed("secondary_attack"): print("pow")

func _physics_process(delta):
	_read_input()
	
func get_current_gun():
	if direction.y == -1:
		return $up
	elif direction.y == 1:
		return $down
	elif direction.x == -1:
		return $left
	elif direction.x == 1 || direction == Vector2():
		return $right
