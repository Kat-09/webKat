extends Node

var fork = "https://github.com/smartcmd/MinecraftConsoles/releases/download/"
var forkExeName = "Minecraft.Client.exe"
var forkZipName = "LCEWindows64.zip"
var forkName = "smartcmd"
var forkTag = "nightly"
var justCameFromUpdate = false
var log = []
var launchMethod = ""

func _ready() -> void:
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
			print("Welcome to the internet have a look around")
