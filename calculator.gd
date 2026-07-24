extends Control

var display
var display_old

var value: String
var last_value


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last_value = 0
	change_display(last_value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		value = value.left(value.length() - 1)
		change_display(value)
	pass

func change_display(value):
	
	$display.text = str(value)
	
func change_value(value):
	pass

func _on_4_pressed() -> void:
	last_value = str(4)
	value = value + last_value
	change_display(value)


func _on_5_pressed() -> void:
	last_value = str(5)
	value = value + last_value
	change_display(value)


func _on_6_pressed() -> void:
	last_value = str(6)
	value = value + last_value
	change_display(value)


func _on_1_pressed() -> void:
	last_value = str(1)
	value = value + last_value
	change_display(value)


func _on_2_pressed() -> void:
	last_value = str(2)
	value = value + last_value
	change_display(value)


func _on_3_pressed() -> void:
	last_value = str(3)
	value = value + last_value
	change_display(value)


func _on_comma_pressed() -> void:
	last_value = str(".")
	value = value + last_value
	change_display(value)


func _on_0_pressed() -> void:
	last_value = str(0)
	value = value + last_value
	change_display(value)



func _on_9_pressed() -> void:
	last_value = str(9)
	value = value + last_value
	change_display(value)


func _on_8_pressed() -> void:
	last_value = str(8)
	value = value + last_value
	change_display(value)


func _on_7_pressed() -> void:
	last_value = str(7)
	value = value + last_value
	change_display(value)
