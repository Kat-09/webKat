extends Node2D

@onready var gamereq := $GameZipDownloader
@onready var musicreq := $GameMusicDownloader

var thread: Thread
var finished: int = 0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dir = DirAccess.open("user://")
	dir.make_dir_recursive("user://Launcher/Game/"+globalKLauncher.forkName)
	
	if !FileAccess.file_exists("user://Launcher/Game/"+globalKLauncher.forkName+"/username.txt") or !!FileAccess.file_exists("user://Launcher/Game/"+globalKLauncher.forkName+"/uid.txt"):
		var file = FileAccess.open("user://Launcher/Game/"+globalKLauncher.forkName+"/username.txt", FileAccess.WRITE)
		file.store_string("KLauncherUser")
		globalKLauncher.uid = gen_unique_string(16)
		var file2 = FileAccess.open("user://Launcher/Game/"+globalKLauncher.forkName+"/uid.dat", FileAccess.WRITE)
		file2.store_string(globalKLauncher.uid)
	
	gamereq.download_file = "user://Launcher/Temp/Minecraft.Client.zip"
	gamereq.request(globalKLauncher.fork + globalKLauncher.forkTag + "/" + globalKLauncher.forkZipName)

func gen_unique_string(length: int) -> String:
	var ascii_letters_and_digits = "ABCDEF0123456789"
	var result = ""
	for i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return "0x" + result

func _process(delta: float) -> void:
	#Run finish() once, i couldn't figure out a better way to do this, there probably is a better way though.
	if finished >= 2:
		finish()
		globalKLauncher.justCameFromUpdate = true
		finished = 0

func _on_game_zip_downloader_request_completed(_none, _none1, _none2, _none3) -> void:
	var dir = DirAccess.open("user://")
	dir.make_dir_recursive("user://Launcher/Game/"+globalKLauncher.forkName+"/")
	$Label.text = "Extracting Files..."
	thread = Thread.new()
	thread.start(game_extract_all_from_zip.bind("user://Launcher/Game/"+globalKLauncher.forkName+"/"))
	gamereq.queue_free()
	musicreq.download_file = "user://Launcher/Temp/music.zip"
	musicreq.request("https://www.floatingpoint.fyi/public-storage/downloadables/zips/music/music.zip")
	

#Got ts from godot docs lol
func game_extract_all_from_zip(filePath):
	var reader = ZIPReader.new()
	reader.open("user://Launcher/Temp/Minecraft.Client.zip")

	# Destination directory for the extracted files (this folder must exist before extraction).
	# Not all ZIP archives put everything in a single root folder,
	# which means several files/folders may be created in `root_dir` after extraction.
	var root_dir = DirAccess.open(filePath)

	var files = reader.get_files()
	for file_path in files:
		# If the current entry is a directory.
		if file_path.ends_with("/"):
			root_dir.make_dir_recursive(file_path)
			continue

		# Write file contents, creating folders automatically when needed.
		# Not all ZIP archives are strictly ordered, so we need to do this in case
		# the file entry comes before the folder entry.
		root_dir.make_dir_recursive(root_dir.get_current_dir().path_join(file_path).get_base_dir())
		var file = FileAccess.open(root_dir.get_current_dir().path_join(file_path), FileAccess.WRITE)
		var buffer = reader.read_file(file_path)
		file.store_buffer(buffer)
	
	finished += 1
	return

func music_extract_all_from_zip(filePath):
	
	var reader = ZIPReader.new()
	reader.open("user://Launcher/Temp/music.zip")

	# Destination directory for the extracted files (this folder must exist before extraction).
	# Not all ZIP archives put everything in a single root folder,
	# which means several files/folders may be created in `root_dir` after extraction.
	var root_dir = DirAccess.open(filePath)

	var files = reader.get_files()
	for file_path in files:
		# If the current entry is a directory.
		if file_path.ends_with("/"):
			root_dir.make_dir_recursive(file_path)
			continue

		# Write file contents, creating folders automatically when needed.
		# Not all ZIP archives are strictly ordered, so we need to do this in case
		# the file entry comes before the folder entry.
		root_dir.make_dir_recursive(root_dir.get_current_dir().path_join(file_path).get_base_dir())
		var file = FileAccess.open(root_dir.get_current_dir().path_join(file_path), FileAccess.WRITE)
		var buffer = reader.read_file(file_path)
		file.store_buffer(buffer)
	
	finished += 1
	return


func finish():
	$Label.text = "Finished!!!"
	$Node/AnimationPlayer.play("FadeOut")

func _exit_tree() -> void:
	thread.wait_to_finish()

func _on_animation_player_animation_finished(_none) -> void:
	RmDir.rmdir("user://Launcher/Temp/")
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_game_music_downloader_request_completed(_none, _none1, _none2, _none3) -> void:
	var dir = DirAccess.open("user://")
	dir.make_dir_recursive("user://Launcher/Music/")
	thread = Thread.new()
	thread.start(music_extract_all_from_zip.bind("user://Launcher/Music/"))
	musicreq.queue_free()
