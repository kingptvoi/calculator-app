extends Control

@onready var display = $display

var current_opperation
var display_value
var last_value

var comma

func _ready() -> void:
	display_value = "0"
	current_opperation = ""
	change_display(display_value)

func change_display(value) -> void:
	display.text = str(value)

func on_number_pressed(number: int) -> void:
	if display_value == "0":
		if current_opperation == ".":
			display_value += str(".")
			change_display(display_value)
		else:
			display_value = str(number)
	else:
		display_value += str(number)
	change_display(display_value)
	print(number)

func on_symbol_pressed(symbol: String) -> void:
	print(symbol)
	if symbol == "ce":
		display_value = "0"
		change_display(display_value)
	if symbol == "ca":
		display_value = "0"
		last_value = str(0)
		current_opperation = ""
		change_display(display_value)
	if symbol == "clear":
		if display_value == "0":
			display_value = "0"
			change_display("0")
		else:
			display_value = display_value.left(display_value.length() - 1)
			change_display(display_value)
			
	if symbol == ".":
		if comma:
			pass
		else:
			comma != comma
			display_value += str(".")
			change_display(display_value)
			
	if symbol == "+":
		if display_value == "0":
			display_value = "0"
		else:
			current_opperation = "+"
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "*":
		if display_value == "0":
			display_value = "0"
		else:
			current_opperation = "*"
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "/":
		if display_value == "0":
			display_value = "0"
		else:
			current_opperation = "/"
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "-":
		if display_value == "0":
			display_value = "0"
		else:
			current_opperation = "-"
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "=":
		if current_opperation == "+":
			display_value = str(float(display_value) + float(last_value))
			change_display(display_value)
		if current_opperation == "*":
			display_value = str(float(display_value) * float(last_value))
			change_display(display_value)
		if current_opperation == "/":
			display_value = str(float(last_value) / float(display_value))
			change_display(display_value)
		if current_opperation == "-":
			display_value = str(float(last_value) - float(display_value))
			change_display(display_value)
