extends Node2D

@onready var meowth_img = $Meowth
@onready var butterfree_img = $Butterfree
@onready var jigglypuff_img = $Jigglypuff
@onready var eevee_img = $Eevee

var poke_list
var poke_id
	
func _ready():	
	poke_list = [meowth_img, eevee_img, jigglypuff_img, butterfree_img]

	
func reset():
	for n in range(poke_list.size()):
		poke_list[n].visible = false
	pass

func _on_pokeball_nextfruit(id: int):
	if (poke_list != null):
		reset();
		poke_list[id].visible = true
	pass # Replace with function body.
