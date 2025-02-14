extends CharacterBody2D

@export var speed = 600
@onready var sprite = $AnimatedSprite2D

const idleVector = Vector2(0, 0)

func get_input():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	
	if direction.x < 0  && sprite.flip_h != true:
		sprite.flip_h = true
	elif direction.x > 0 && sprite.flip_h != false:
		sprite.flip_h = false
	
	if direction != idleVector:
		sprite.play("hop")
	else:
		sprite.play("idle")

func _physics_process(delta):
	get_input()
	move_and_slide()
