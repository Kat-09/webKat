extends Button

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
		$"../../../../ButtonClick".play()
		if globalKLauncher.launchMethod == "wine":
			print(ProjectSettings.globalize_path("user://Launcher/Game/"+globalKLauncher.forkName+"/"+globalKLauncher.forkExeName))
			OS.create_process(globalKLauncher.launchMethod, [ ProjectSettings.globalize_path("user://Launcher/Game/"+globalKLauncher.forkName+"/"+globalKLauncher.forkExeName) ])
		else:
			OS.create_process(ProjectSettings.globalize_path("user://Launcher/Game/"+globalKLauncher.forkName+"/"+globalKLauncher.forkExeName), [], true)
		get_tree().quit()
