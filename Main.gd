extends Control

func change_label(value):
	$Label.text = str(value)

func _ready():
#	var value = "emptyness"
#	change_label(value)
	pass
	
func _on_one_pressed():
#	change_label("One")
	Network._send_button({
		"type":"button",
		"value":"one server"
	})

func _on_two_pressed():
#	change_label("Two")	
	Network._send_button({
		"type":"button",
		"value":"two server"
	})

func _on_three_pressed():
#	change_label("Three")
	Network._send_button({
		"type":"button",
		"value":"three server"
	})
	
