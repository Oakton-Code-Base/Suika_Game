extends Node2D

#vars
@onready var meowth_img = $Meowth
@onready var eevee_img = $Eevee
@onready var jigglypuff_img = $Jigglypuff
@onready var butterfree_img = $Butterfree
@onready var bulbasaur_img = $Bulbasaur
@onready var squirtle_img = $Squirtle
@onready var charmander_img = $Charmander
@onready var pikachu_img = $Pikachu

@onready var rng = RandomNumberGenerator.new()

var poke_list
var current_poke
var current_poke_id

var next_poke
var next_poke_id

var tick = 0
var wait = false

signal dropped_fruit
signal nextfruit


const speed = 6
const drop_cooldown = 0
#55	


func pick_random_poke():
	return rng.randi_range(0, 3)

func spawn_new_fruit():
	
	next_poke_id = pick_random_poke()
	next_poke = poke_list[next_poke_id]	
	nextfruit.emit(next_poke_id)
	
	current_poke.show()

func _ready():
	rng.randomize()
	setup()
	current_poke_id = pick_random_poke()
	current_poke = poke_list[current_poke_id]
	
	spawn_new_fruit()

	

func _drop():
	current_poke.hide()
	
	wait = true
	dropped_fruit.emit(position, current_poke_id)
	current_poke = next_poke
	

func _physics_process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	
	
	if mouse_x > 410 and mouse_x < 980:
		position.x = mouse_x
	if Input.is_action_just_pressed("drop") and wait == false:
		_drop()
		
	if wait:
		_ticker()

func _ticker():
	tick += 1
	if tick > drop_cooldown:
	#	print('ready')
		spawn_new_fruit()
		tick = 0
		wait = false
		
func setup():
	poke_list = [meowth_img, eevee_img, jigglypuff_img, butterfree_img, bulbasaur_img, squirtle_img,
				   charmander_img, pikachu_img ]
	
