extends Node3D

var direction: Vector2
var speed := 10
var mouse_acceleration = Vector2(0.001, 0.001)

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$Camera3D.rotation.y -= event.relative.x * mouse_acceleration.x
		$Camera3D.rotation.x -= event.relative.y * mouse_acceleration.y
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, -PI/3, PI/3 )
		
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			var collider = $Camera3D/RayCast3D.get_collider()

func get_input():
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _process(_delta: float) -> void:
	get_input()
