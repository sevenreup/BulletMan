extends KinematicBody2D
class_name GameEntity

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
var max_health : int = 100
var current_health : int = 100
var health_regen : int = 1
var armor : int = 0

var max_mana : int = 100
var current_mana : int = 100
var mana_regen : int = 1
var max_speed : float = 200
var current_speed : float = 0
var acceleration: float = 4
var agility : int = 0
var globat_cooldown = 30
var is_busy : bool = false
var last_ability :int = 0

func regen_health():
	if (current_health < max_health):
		if ((health_regen + current_health) > max_health):
			current_health = max_health
	else: current_health += health_regen

func regen_mana() :
	if (current_mana < max_mana):
		if ( (mana_regen + current_mana) > max_mana):
			current_mana = max_mana
	else: current_mana += mana_regen
	
func modify_mana(amount):
	var new_mana = current_mana + amount
	if (new_mana < 0): current_mana = 0
	if (new_mana > max_mana): current_mana = max_mana
	else: current_mana += amount
	
func apply_damage(amount):
	if (armor > 0): amount = amount * ((100 - amount) * .01)
	if (current_health > amount): current_health -= amount
	else: print("death" )
	
func _physics_process(delta):
	last_ability += 1
	if ((GameMaster.count % 60) == 0):
		regen_health()
		regen_mana()
		
func load_ability(name):
	var scene = load("res://scripts/abilities/" + name + "/" + name + ".tscn")
	var sceneNode = scene.instance()
	add_child(sceneNode)
	return sceneNode
