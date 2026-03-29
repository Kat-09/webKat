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
		if $"../HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit".text != ""  and $"../HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit".text != "":
			$"../../../..".setGlobalsToLabelEdit()
			dir.make_dir_recursive("user://Launcher/Game/")
			var file3 = FileAccess.open("user://Launcher/Game/fork.txt", FileAccess.WRITE)
			file3.store_string(globalKLauncher.fork)
			var file4 = FileAccess.open("user://Launcher/Game/forkName.txt", FileAccess.WRITE)
			file4.store_string(globalKLauncher.forkName)
			var file5 = FileAccess.open("user://Launcher/Game/forkTag.txt", FileAccess.WRITE)
			file5.store_string(globalKLauncher.forkTag)
			var file6 = FileAccess.open("user://Launcher/Game/forkExeName.txt", FileAccess.WRITE)
			file6.store_string(globalKLauncher.forkExeName)
			var file7 = FileAccess.open("user://Launcher/Game/forkZipName.txt", FileAccess.WRITE)
			file7.store_string(globalKLauncher.forkZipName)
			var file = FileAccess.open("user://Launcher/Game/launchMethod.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.launchMethod)
		if $"../HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit".text != "" and $"../HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit".text != "":
			globalKLauncher.username = $"../HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit".text
			globalKLauncher.uid = $"../HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit".text
			dir.make_dir_recursive("user://Launcher/Game/"+globalKLauncher.forkName+"/")
			var file = FileAccess.open("user://Launcher/Game/"+globalKLauncher.forkName+"/username.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.username)
			var file2 = FileAccess.open("user://Launcher/Game/"+globalKLauncher.forkName+"/uid.dat", FileAccess.WRITE)
			file2.store_string(globalKLauncher.uid)
		
		$"../../../../ButtonClick".play()
		$"..".hide()
		$"../../MenuVBox".show()
		$"../../MenuVBox/OptionsBtn".grab_focus()
