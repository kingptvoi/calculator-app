extends Control

@onready var display = $display

var current_operation
var display_value
var last_value

var comma

func _ready() -> void:
	display_value = "0"
	current_operation = ""
	change_display(display_value)

func change_display(value) -> void:
	display.text = str(value)
	#format_number(int(value))
	#format_float(int(value))

func on_number_pressed(number: int) -> void:
	if display_value == "0":
		if current_operation == ".":
			display_value += str(".")
			change_display(display_value)
		else:
			display_value = str(number)
	else:
		display_value += str(number)
	change_display(display_value)
	font_size()
	print(number)
	
func font_size():
	var font_size: float
	if display_value.length() > 18:
		font_size = display_value.length() - 18
	else:
		font_size = 0
	display.add_theme_font_size_override("font_size", 26 - font_size)
	
func format_number(number: int) -> String:
	var text := str(number)
	var result := ""

	while text.length() > 3:
		result = "," + text.substr(text.length() - 3, 3) + result
		text = text.substr(0, text.length() - 3)

	return text + result
	print(text + result)
	
func format_float(number: float) -> String:
	var parts = str(number).split(".")
	parts[0] = format_number(int(parts[0]))

	if parts.size() > 1:
		return parts[0] + "." + parts[1]

	return parts[0]
	

func on_symbol_pressed(symbol: String) -> void:
	
	print(symbol)
	
	if symbol == "-+":
		display_value = str(str_to_var(display_value) * -1)
		change_display(display_value)
		
	if symbol == "ca":
		display_value = "0"
		last_value = str(0)
		current_operation = ""
		change_display(display_value)
		
	if symbol == "clear":
		if display_value == "0":
			display_value = "0"
			change_display(display_value)
		elif display_value == "inf":
			display_value = "0"
			change_display(display_value)
		elif display_value == "-":
			display_value = "0"
			change_display(display_value)
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
		current_operation = "+"
		if display_value == "0":
			display_value = "0"
		else:
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "*":
		current_operation = "*"
		if display_value == "0":
			display_value = "0"
		else:
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "/":
		current_operation = "/"
		if display_value == "0":
			display_value = "0"
		else:
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "-":
		current_operation = "-"
		if display_value == "0":
			display_value = "0"
		else:
			last_value = str(display_value)
			display_value = "0"
			change_display("0")
			
	if symbol == "=":
		if current_operation == "+":
			display_value = str(float(display_value) + float(last_value))
			change_display(display_value)
		if current_operation == "*":
			display_value = str(float(display_value) * float(last_value))
			change_display(display_value)
		if current_operation == "/":
			display_value = str(float(last_value) / float(display_value))
			change_display(display_value)
		if current_operation == "-":
			display_value = str(float(last_value) - float(display_value))
			change_display(display_value)
		else: pass
