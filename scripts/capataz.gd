extends CharacterBody2D

const SPEED = 50
var direction := -1   # -1 izquierda, 1 derecha

@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	velocity.x = direction * SPEED

	move_and_slide()

	anim.flip_h = direction < 0
	anim.play("Walk")

	# Si choca contra pared, se da la vuelta
	if is_on_wall():
		direction *= -1

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()

func _ready() -> void:
	add_to_group("Player")
