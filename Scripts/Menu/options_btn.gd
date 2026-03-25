extends Button


# Called when the node enters the scene tree for the first time.
func _on_mouse_entered() -> void:
	if disabled == false:
		$Label.add_theme_color_override("font_color",Color.YELLOW)

func _on_mouse_exited() -> void:
	if disabled == false:
		$Label.add_theme_color_override("font_color",Color.WHITE)

func _on_focus_entered() -> void:
	if disabled == false:
		$Label.add_theme_color_override("font_color",Color.YELLOW)

func _on_focus_exited() -> void:
	if disabled == false:
		$Label.add_theme_color_override("font_color",Color.WHITE)

func _on_pressed() -> void:
	if disabled == false:
		$"..".hide()
		$"../../OptionsVBox".show()
		var file = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/uid.txt", FileAccess.WRITE)
		file.store_string(Shitfart.uid)
