extends Node2D

func execute(s, dir):
	s.velocity = Vector2()
	if dir == "up":
		s.velocity.y -= 1
		s.direction = Vector2(0, -1)
	if dir == "down":
		s.velocity.y += 1
		s.direction = Vector2(0, 1)
	if dir == "left":
		s.velocity.x -= 1
		s.direction = Vector2(-1, 0)
	if  dir == "right":
		s.velocity.x += 1
		s.direction = Vector2(1, 0)
	
	s.velocity = s.velocity.normalized()
	s.velocity = s.move_and_slide(s.velocity * s.max_speed)
