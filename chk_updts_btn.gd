extends Button

@onready var req := $HTTPRequest
var updateClickCount = 0

const CHUNK_SIZE = 1024
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

func disableButtons():
	$"../StartBtn".disabled = true
	disabled = true
	$"../OptionsBtn".disabled = true
	$"../ExitBtn".disabled = true
	$"../../../".modulate = Color(0.29, 0.29, 0.29, 1.0)

func enableButtons():
	var dir = DirAccess.open("user://Launcher/Temp/")
	dir.remove("user://Launcher/Temp/Minecraft.Client.exe")
	dir.remove("user://Launcher/Temp/Minecraft.Client.zip")
	$"../StartBtn".disabled = false
	disabled = false
	$"../OptionsBtn".disabled = false
	$"../ExitBtn".disabled = false
	$"../../../".modulate = Color(1.0, 1.0, 1.0, 1.0)

var dir = DirAccess.open("user://")
func _on_pressed() -> void:
	if disabled == false:
		disableButtons()
		dir.make_dir_recursive("user://Launcher/Temp/")
		req.download_file = "user://Launcher/Temp/Minecraft.Client.exe"
		req.request(globalKLauncher.fork + globalKLauncher.forkTag + "/" + globalKLauncher.forkExeName)
		$Label.text = "Checking for updates..."
		updateClickCount += 1

var downloadedhash = null

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	downloadedhash = hash_file("user://Launcher/Temp/Minecraft.Client.exe")
	if downloadedhash != loadPreviousHashFromFile():
		saveDownloadedHashToFile()
		$"../../../../AnimationPlayer".play("FadeOut")
	else:
		enableButtons()
		$Label.text = "You are already up to date!"
		$Label.add_theme_color_override("font_color",Color.WHITE)
		if updateClickCount == 3:
			$Label.text = "Click me again to force-update!"
		if updateClickCount >= 4:
			$Label.text = "Force Updating!"
			$"../../../../AnimationPlayer".play("FadeOut")

func loadPreviousHashFromFile():
	if FileAccess.file_exists("user://Launcher/hash-"+globalKLauncher.forkName+".txt"):
		var file = FileAccess.open("user://Launcher/hash-"+globalKLauncher.forkName+".txt", FileAccess.READ)
		var content = file.get_as_text()
		return content
	else:
		return ""

func saveDownloadedHashToFile():
	var file = FileAccess.open("user://Launcher/hash-"+globalKLauncher.forkName+".txt", FileAccess.WRITE)
	file.store_string(downloadedhash)


func hash_file(path):
	# Check that file exists.
	if not FileAccess.file_exists(path):
		return
	# Start an MD5 context.
	var ctx = HashingContext.new()
	ctx.start(HashingContext.HASH_MD5)
	# Open the file to hash.
	var file = FileAccess.open(path, FileAccess.READ)
	# Update the context after reading each chunk.
	while file.get_position() < file.get_length():
		var remaining = file.get_length() - file.get_position()
		ctx.update(file.get_buffer(min(remaining, CHUNK_SIZE)))
	# Get the computed hash.
	var res = ctx.finish()
	# Print the result as hex string and array.
	return(res.hex_encode())

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeOut":
		get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")
