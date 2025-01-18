extends Node2D

var meowth = preload("res://shapes/meowth.tscn")
var eevee = preload("res://shapes/eevee.tscn")
var jigglypuff = preload("res://shapes/jigglypuff.tscn")
var butterfree = preload("res://shapes/butterfree.tscn")
var bulbasaur = preload("res://shapes/bulbasaur.tscn")
var squirtle = preload("res://shapes/squirtle.tscn")
var charmander = preload("res://shapes/charmander.tscn")
var pikachu = preload("res://shapes/pikachu.tscn")

var current_fruit
var fruit_list = [ meowth, eevee, jigglypuff, butterfree, bulbasaur, squirtle,
				   charmander, pikachu ]


func _physics_process(delta):
	if Input.is_action_just_pressed("close"):
		get_tree().quit()

func _spawn_fruit(pos, fruit_id):
	current_fruit = fruit_list[fruit_id].instantiate()
	add_child(current_fruit)
	current_fruit.fruits_collided.connect(_spawn_next_fruit)
	current_fruit.position = pos
	
func _on_pokeball_dropped_fruit(pos, fruit_id):
	_spawn_fruit(pos, fruit_id)
	
func _spawn_next_fruit(poke_id, pos):
	#print('new spawn')
	var new_id = poke_id + 1
	_spawn_fruit(pos, new_id)
	
	

	
	
