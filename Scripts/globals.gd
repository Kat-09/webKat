extends Node

var fork
var forkExeName
var forkZipName
var forkName
var forkTag
var justCameFromUpdate = false
var logpath = []
var launchMethod = ""
var username
var uid

func _globalKLauncherInit():
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://Launcher/Game/"):
		fork = FileAccess.get_file_as_string("user://Launcher/Game/fork.txt")
		forkName = FileAccess.get_file_as_string("user://Launcher/Game/forkName.txt")
		if dir.file_exists("user://Launcher/Game/"+forkName+"/"+"username.txt"):
			username = FileAccess.get_file_as_string("user://Launcher/Game/"+forkName+"/"+"username.txt")
		else:
			username = "KLauncherUser"
		if dir.file_exists("user://Launcher/Game/"+forkName+"/"+"uid.txt"):
			uid = FileAccess.get_file_as_string("user://Launcher/Game/"+forkName+"/"+"uid.dat")
		else:
			uid = gen_unique_string(16)
		launchMethod = FileAccess.get_file_as_string("user://Launcher/Game/launchMethod.txt")
		forkTag = FileAccess.get_file_as_string("user://Launcher/Game/forkTag.txt")
		forkExeName = FileAccess.get_file_as_string("user://Launcher/Game/forkExeName.txt")
		forkZipName = FileAccess.get_file_as_string("user://Launcher/Game/forkZipName.txt")
	else:
		fork = "https://github.com/MCLCE/MinecraftConsoles/releases/download/"
		forkExeName = "Minecraft.Client.exe"
		forkZipName = "LCEWindows64.zip"
		forkName = "MCLCE"
		forkTag = "nightly"
		username = "KLauncherUser"
		uid = gen_unique_string(16)
func gen_unique_string(length: int) -> String:
	var ascii_letters_and_digits = "ABCDEF0123456789"
	var result = ""
	for i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return "0x" + result
