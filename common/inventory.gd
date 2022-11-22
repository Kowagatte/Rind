extends Node2D

export var display_name = "Inventory"
export var size = 25

func isFull():
	return get_child_count() >= size

func isEmpty():
	return get_child_count() == 0

func add(item):
	pass

func _ready():
	pass

func _process(_delta):
	pass
