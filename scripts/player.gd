extends CharacterBody2D

@export var speed = 130.0
@export var jumpVelocity = -350.0
@export var gravity = Vector2(0, 980)
@onready var sprite = $AnimatedSprite2D

const idleVector = Vector2(0, 0)

func _physics_process(delta):
	var direction := Input.get_axis("move_left", "move_right")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpVelocity

	
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	if not is_on_floor():
		velocity += gravity * delta
		
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
	else:
		sprite.play("hop")
	
	if direction:
		sprite.play("hop")
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	
	move_and_slide()
