extends RigidBody2D	

class_name PokeBase

signal fruits_collided

@export var poke_id = SUIKA.POKES 
var wait = false

func _init():
	contact_monitor = true
	max_contacts_reported= 5

func _physics_process(delta):
	var contacts = get_colliding_bodies()
	var num = get_contact_count()
	
	for body in contacts:
		if body is PokeBase:
			if poke_id == body.poke_id and not body.wait and not wait:
				wait = true
				
				body.wait = true
				
				body.queue_free()
				
				queue_free()
				#fruits_collided.emit(position, poke_id)
				fruits_collided.emit(poke_id, position)
				print('collide')
				wait = false
			
				
				
				
				
 				
