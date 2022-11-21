extends KinematicBody2D


export (int) var speed = 100
# [IDLE, RIGHT, LEFT]
var direction = [true, false, false]
var velocity = Vector2()

var sprite: AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("animated_sprite") as AnimatedSprite


func change_direction():
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("D"):
		velocity.x += 1
	if Input.is_action_pressed("A"):
		velocity.x -= 1
	if Input.is_action_pressed("S"):
		velocity.y += 1
	if Input.is_action_pressed("W"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	
	# moving right
	if velocity.x > 0:
		sprite.play("walk_right")
	# moving left
	elif velocity.x < 0:
		sprite.play("walk_left")
	# not moving horizontally
	elif velocity.x == 0:
		sprite.play("idle")
	
	velocity = move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
