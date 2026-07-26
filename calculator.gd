extends Control

@onready var display = $display

var display_value: String

var current_opperation: String

var last_value

func _ready() -> void:
	display_value = "0"
	current_opperation = ""
	change_display(display_value)

func change_display(value) -> void:
	display.text = str(value)

func on_number_pressed(number: int) -> void:
	if display_value == "0":
		display_value = str(number)
	else:
		display_value += str(number)
	change_display(display_value)
	print(number)

func on_symbol_pressed(symbol: String) -> void:
	print(symbol)
	if symbol == "clear":
		if display_value == "0":
			pass
		else:
			display_value = display_value.left(display_value.length() - 1)
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
			display_value = str(str_to_var(display_value) + str_to_var(last_value))
			change_display(display_value)
		if current_opperation == "*":
			display_value = str(str_to_var(display_value) * str_to_var(last_value))
			change_display(display_value)
		if current_opperation == "/":
			display_value = str(str_to_var(last_value) / str_to_var(display_value))
			change_display(display_value)
		if current_opperation == "-":
			display_value = str(str_to_var(last_value) - str_to_var(display_value))
			change_display(display_value)
