extends Control

var display
var display_old


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_display(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_display(value):
	$display.text = str(display_old) + str(value)
	display_old = $display.text


func _on__pressed() -> void:
	change_display(4)
