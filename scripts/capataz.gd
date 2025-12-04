extends CharacterBody2D

const SPEED = 50
var direction := -1   # -1 izquierda, 1 derecha

@onready var anim = $AnimatedSprite2D
@onready var area = $Area2D

func _ready() -> void:
	# Conectar la señal del Area2D
	area.body_entered.connect(_on_area_2d_body_entered)

func _physics_process(delta):
	velocity.x = direction * SPEED
	
	move_and_slide()
	
	anim.flip_h = direction < 0
	anim.play("Walk")
	
	# Si choca contra pared, se da la vuelta
	if is_on_wall():
		direction *= -1

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
