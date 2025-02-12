extends CharacterBody2D

@export var speed = 600

func get_input():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600

func _physics_process(delta):
	get_input()
	move_and_slide()
