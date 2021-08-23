extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var speed = 200
var velocity = Vector2.ZERO
var gravity = 8;
var g_velocity  = 0
var jump_height = -300


func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if is_on_floor():
		g_velocity = 0
		if Input.is_action_pressed("ui_up"):
			g_velocity  = jump_height
	g_velocity += gravity;
	velocity.y += g_velocity;
	velocity = move_and_slide(velocity,Vector2(0,-1))


func _on_Area2D_body_entered(body):
	pass # Replace with function body.


func _on_Game_over_body_entered(body):
	get_tree().change_scene("res://game_over_1.tscn")


func _on_You_Win_body_entered(body):
	get_tree().change_scene("res://You win.tscn")
