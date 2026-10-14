extends Window

@onready var book_3: LineEdit = $Control/MarginContainer/VBoxContainer/Book3
@onready var book_2: LineEdit = $Control/MarginContainer/VBoxContainer/Book2
@onready var book_1: LineEdit = $Control/MarginContainer/VBoxContainer/Book1

var count: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if book_1.text == "1":
		book_1.placeholder_text = "1"
		book_1.text = ""
		book_1.editable = false
		count += 1
		
	if book_2.text == "2":
		book_2.placeholder_text = "2"
		book_2.text = ""
		book_2.editable = false
		count += 1
		
	if book_3.text == "3":
		book_3.placeholder_text = "3"
		book_3.text = ""
		book_3.editable = false
		count += 1

	if count == 3:
		queue_free()
