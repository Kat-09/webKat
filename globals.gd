extends Node

var fork
var forkExeName
var forkZipName
var forkName
var forkTag
var justCameFromUpdate = false
var log = []
var launchMethod = ""
var username
var uid

func _shitFartInit():
	match OS.get_name():
		"Windows":
			launchMethod = ""
		"macOS":
			launchMethod = "wine"
		"Linux", "FreeBSD", "NetBSD", "OpenBSD", "BSD":
			launchMethod = "wine"
		"Android":
			launchMethod = "yeah ok what"
		"iOS":
			launchMethod = "yeah uhhh idk how thats gonna work uhhhh hi"
		"Web":
			launchMethod = "oh okay hi uh idk how u got ts but ok"
			print("oh okay hi uh idk how u got ts but ok")
	_getOptionsValues()
	
func _getOptionsValues():
	var dir = DirAccess.open("user://")
	if forkName != null:
		if dir.dir_exists("user://Launcher/Game/"+forkName+"/"):
			fork = FileAccess.get_file_as_string("user://Launcher/Game/fork.txt")
			forkName = FileAccess.get_file_as_string("user://Launcher/Game/forkName.txt")
			username = FileAccess.get_file_as_string("user://Launcher/Game/"+forkName+"/"+"username.txt")
			uid = FileAccess.get_file_as_string("user://Launcher/Game/"+forkName+"/"+"uid.dat")
			forkTag = FileAccess.get_file_as_string("user://Launcher/Game/forkTag.txt")
			forkExeName = FileAccess.get_file_as_string("user://Launcher/Game/forkExeName.txt")
			forkZipName = FileAccess.get_file_as_string("user://Launcher/Game/forkZipName.txt")
	else:
		fork = "https://github.com/smartcmd/MinecraftConsoles/releases/download/"
		forkExeName = "Minecraft.Client.exe"
		forkZipName = "LCEWindows64.zip"
		forkName = "smartcmd"
		forkTag = "nightly"
		username = "KLauncherUser"
		uid = "0xBBBBBBBBBBBBBBBB"
		
