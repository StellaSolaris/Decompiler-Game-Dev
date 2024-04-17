extends CharacterBody2D

@onready var hurtbox = $Hurtbox

func _ready():
	hurtbox.body_entered.connect(_on_hurtbox_body_entered)



func _physics_process(delta):
	
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_vector * 100
	
	
	
	
	'''if Input.is_action_pressed("ui_right"):
		velocity.x = 100.0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -100.0
	else: 
		velocity.x = 0
		
	if Input.is_action_pressed("ui_up"):
		velocity.y = -100.0
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 100.0
	else:
		velocity.y = 0
	'''	
	move_and_slide()

func _on_hurtbox_body_entered(body):
	Events.balloon_popped.emit()
	queue_free()
	
