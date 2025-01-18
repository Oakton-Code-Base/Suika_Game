extends RigidBody2D	

class_name PokeBase

signal fruits_collided

@export var poke_id = SUIKA.POKES 

func _init():
	contact_monitor = true
	max_contacts_reported= 5

func _physics_process(delta):
	var contacts = get_colliding_bodies()
	var num = get_contact_count()

	for body in contacts:
		if body is PokeBase:
			if poke_id == body.poke_id:
				body.queue_free()
				
				queue_free()
				
 				
