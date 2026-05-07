extends Control

#Yeah ik my implementation of an options menu is quite sloppy and kinda bad, but I don't mind as I would just like to get it working for now, I will revamp this at some point, but not yet.

func _ready() -> void:
	globalKLauncher._globalKLauncherInit()
	$Menu/MenuMargin/MenuVBox/StartBtn.grab_focus()
	doStuff()
	
func music():
	var musicToPlay
	match randi_range(0,4):
		3:
			musicToPlay = AudioStreamOggVorbis.load_from_file("user://Launcher/Music/0.ogg")
		2:
			musicToPlay = AudioStreamOggVorbis.load_from_file("user://Launcher/Music/1.ogg")
		1:
			musicToPlay = AudioStreamOggVorbis.load_from_file("user://Launcher/Music/2.ogg")
		0:
			musicToPlay = AudioStreamOggVorbis.load_from_file("user://Launcher/Music/3.ogg")
	$Music.stream = musicToPlay
	$Music.play()


func _process(_delta: float) -> void:
	if Input.is_action_pressed("shift") and $Menu/MenuMargin/MenuVBox/ChkUpdtsBtn.disabled == false:
		$Menu/MenuMargin/MenuVBox/Reset.visible = true
		$Menu/MenuMargin/MenuVBox/Reset.disabled = false
	else:
		$Menu/MenuMargin/MenuVBox/Reset.clickCount = 0
		$Menu/MenuMargin/MenuVBox/Reset/Label.text = "Reset Data?"
		$Menu/MenuMargin/MenuVBox/Reset.visible = false
		$Menu/MenuMargin/MenuVBox/Reset.disabled = true

func setGlobalsToLabelEdit():
	var dir = DirAccess.open("user://")
	
	if !dir.dir_exists("user://Launcher/Game/"):
		match OS.get_name():
			"Windows":
				globalKLauncher.launchMethod = ""
				print("wtf")
			"macOS":
				globalKLauncher.launchMethod = "wine"
			"Linux", "FreeBSD", "NetBSD", "OpenBSD", "BSD":
				globalKLauncher.launchMethod = "wine"
				print("t")
			"Android":
				globalKLauncher.launchMethod = "yeah ok what"
			"iOS":
				globalKLauncher.launchMethod = "yeah uhhh idk how that's gonna work uhhhh hi"
			"Web":
				globalKLauncher.launchMethod = "oh okay hi uh idk how u got ts but ok"
		dir.make_dir_recursive("user://Launcher/Game/")
		var file = FileAccess.open("user://Launcher/Game/launchMethod.txt", FileAccess.WRITE)
		file.store_string(globalKLauncher.launchMethod)
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
	$"Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/Launch Method/LaunchEdit".text = globalKLauncher.launchMethod
		
		
	
func doStuff():
	var dir = DirAccess.open("user://")
	if dir.file_exists("user://Launcher/hash-"+str(globalKLauncher.forkName)+".txt"):
		music()
		print("fart")
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = false
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = true
		if (FileAccess.file_exists("user://Launcher/Game/"+globalKLauncher.forkName+"/username.txt")):
			globalKLauncher.username = FileAccess.get_file_as_string("user://Launcher/Game/"+globalKLauncher.forkName+"/username.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text = globalKLauncher.username
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text = globalKLauncher.username
			var file = FileAccess.open("user://Launcher/Game/"+globalKLauncher.forkName+"/username.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.username)
			
		if (FileAccess.file_exists("user://Launcher/Game/"+globalKLauncher.forkName+"/uid.dat")):
			globalKLauncher.uid = FileAccess.get_file_as_string("user://Launcher/Game/"+globalKLauncher.forkName+"/uid.dat")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text = globalKLauncher.uid
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text = globalKLauncher.uid
			var file = FileAccess.open("user://Launcher/Game/"+globalKLauncher.forkName+"/uid.dat", FileAccess.WRITE)
			file.store_string(globalKLauncher.uid)
		
		if (FileAccess.file_exists("user://Launcher/Game/fork.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/fork.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit.text = Thing
			globalKLauncher.fork = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit.text = globalKLauncher.fork
			var file = FileAccess.open("user://Launcher/Game/fork.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.fork)
			
		if (FileAccess.file_exists("user://Launcher/Game/forkName.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkName.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit.text = Thing
			globalKLauncher.forkName = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit.text = globalKLauncher.forkName
			var file = FileAccess.open("user://Launcher/Game/forkName.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.forkName)
			
		if (FileAccess.file_exists("user://Launcher/Game/forkTag.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkTag.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit.text = Thing
			globalKLauncher.forkTag = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit.text = globalKLauncher.forkTag
			var file = FileAccess.open("user://Launcher/Game/forkTag.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.forkTag)

		if (FileAccess.file_exists("user://Launcher/Game/forkExeName.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkExeName.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit.text = Thing
			globalKLauncher.forkExeName = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit.text = globalKLauncher.forkExeName
			var file = FileAccess.open("user://Launcher/Game/forkExeName.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.forkExeName)

		if (FileAccess.file_exists("user://Launcher/Game/forkZipName.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkZipName.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit.text = Thing
			globalKLauncher.forkZipName = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit.text = globalKLauncher.forkZipName
			var file = FileAccess.open("user://Launcher/Game/forkZipName.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.forkZipName)

		if (FileAccess.file_exists("user://Launcher/Game/launchMethod.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/launchMethod.txt")
			$"Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/Launch Method/LaunchEdit".text = Thing
			globalKLauncher.launchMethod = Thing
		else:
			$"Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/Launch Method/LaunchEdit".text = globalKLauncher.launchMethod
			var file = FileAccess.open("user://Launcher/Game/launchMethod.txt", FileAccess.WRITE)
			file.store_string(globalKLauncher.launchMethod)
	else:
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = false
		$Menu/MenuMargin/MenuVBox/MultiBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/MultiBtn.visible = false
		$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl.visible = false
		$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl.visible = false
		setGlobalsToLabelEdit()
		$Menu/MenuMargin/MenuVBox/ChkUpdtsBtn.grab_focus()
		$Menu/MenuMargin/MenuVBox/ChkUpdtsBtn/Label.text = "Download Game!"

func onBtnFocusEntered() -> void:
	$ButtonMove.play()
