extends Button

# Called when the node enters the scene tree for the first time.

var thread: Thread
var launched = false

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
		thread = Thread.new()
		thread.start(_launchGame.bind())
	

func minimize():
	get_tree().root.mode = Window.MODE_MINIMIZED

func _launchGame():
	call_deferred("minimize")
	if globalKLauncher.launchMethod == "wine":
		OS.execute(globalKLauncher.launchMethod, [ ProjectSettings.globalize_path("user://Launcher/Game/"+globalKLauncher.forkName+"/"+globalKLauncher.forkExeName) ] , globalKLauncher.log)
	else:
		OS.execute(ProjectSettings.globalize_path("user://Launcher/Game/"+globalKLauncher.forkName+"/"+globalKLauncher.forkExeName), globalKLauncher.log)
