extends Button

var updateClickCount = 0
const CHUNK_SIZE = 1024
# Called when the node enters the scene tree for the first time.

func _on_mouse_entered() -> void:
	if disabled == false and clickCount == 0:
		$Label.add_theme_color_override("font_color",Color.YELLOW)

func _on_mouse_exited() -> void:
	if disabled == false and clickCount == 0:
		$Label.add_theme_color_override("font_color",Color.WHITE)

func _on_focus_entered() -> void:
	if disabled == false and clickCount == 0:
		$Label.add_theme_color_override("font_color",Color.YELLOW)

func _on_focus_exited() -> void:
	if disabled == false and clickCount == 0:
		$Label.add_theme_color_override("font_color",Color.WHITE)

var clickCount = 0

func _on_pressed() -> void:
	if disabled == false:
		$"../../../../ButtonClick".play()
		clickCount += 1
		match clickCount:
			1:
				$Label.text = "Are you sure?"
				$Label.add_theme_color_override("font_color",Color(1.0, 0.0, 0.0, 1.0))
			2:
				$Label.text = "Are you sure???"
				$Label.add_theme_color_override("font_color",Color(0.9, 0.0, 0.0, 1.0))
			3:
				$Label.text = "Are you REALLY sure?"
				$Label.add_theme_color_override("font_color",Color(0.8, 0.0, 0.0, 1.0))
			4:
				$Label.text = "Click again to reset launcher & game data."
				$Label.add_theme_color_override("font_color",Color(0.5, 0.0, 0.0, 1.0))
			5:
				RmDir.rmdir("user://Launcher")
				$"../../../.."._ready()
				globalKLauncher.fork = "https://github.com/MCLCE/MinecraftConsoles/releases/download/"
				globalKLauncher.forkExeName = "Minecraft.Client.exe"
				globalKLauncher.forkZipName = "LCEWindows64.zip"
				globalKLauncher.forkName = "MCLCE"
				globalKLauncher.forkTag = "nightly"
				globalKLauncher.username = "KLauncherUser"
				globalKLauncher.uid = gen_unique_string(16)

func gen_unique_string(length: int) -> String:
	var ascii_letters_and_digits = "ABCDEF0123456789"
	var result = ""
	for i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return "0x" + result
