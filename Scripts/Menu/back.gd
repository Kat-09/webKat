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
		var dir = DirAccess.open("user://")
		if $"../HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit".text != "" and $"../HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit".text != "":
			Shitfart.username = $"../HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit".text
			Shitfart.uid = $"../HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit".text
			var file = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/username.txt", FileAccess.WRITE)
			file.store_string(Shitfart.username)
			var file2 = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat", FileAccess.WRITE)
			file2.store_string(Shitfart.uid)
		if $"../HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit".text != "":
			Shitfart.fork = $"../HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit".text
			Shitfart.forkName = $"../HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit".text
			Shitfart.forkTag = $"../HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit".text
			Shitfart.forkExeName = $"../HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit".text
			Shitfart.forkZipName = $"../HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit".text
			dir.make_dir_recursive("user://Launcher/Game/")
			var file3 = FileAccess.open("user://Launcher/Game/fork.txt", FileAccess.WRITE)
			file3.store_string(Shitfart.fork)
			var file4 = FileAccess.open("user://Launcher/Game/forkName.txt", FileAccess.WRITE)
			file4.store_string(Shitfart.forkName)
			var file5 = FileAccess.open("user://Launcher/Game/forkTag.txt", FileAccess.WRITE)
			file5.store_string(Shitfart.forkTag)
			var file6 = FileAccess.open("user://Launcher/Game/forkExeName.txt", FileAccess.WRITE)
			file6.store_string(Shitfart.forkExeName)
			var file7 = FileAccess.open("user://Launcher/Game/forkZipName.txt", FileAccess.WRITE)
			file7.store_string(Shitfart.forkZipName)
		
		$"..".hide()
		$"../../MenuVBox".show()
