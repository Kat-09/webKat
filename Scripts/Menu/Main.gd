extends Control


#Yes, i am aware my implementation of an options menu is quite slow and kinda bad, but I don't mind as I would just like to get it working for now, I will revamp this at some point, but not yet.

func _ready() -> void:
	
	Shitfart._shitFartInit()
	
	doStuff()
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("shift") and $Menu/MenuMargin/MenuVBox/ChkUpdtsBtn.disabled == false:
		$Menu/MenuMargin/MenuVBox/Reset.visible = true
		$Menu/MenuMargin/MenuVBox/Reset.disabled = false
	else:
		$Menu/MenuMargin/MenuVBox/Reset.clickCount = 0
		$Menu/MenuMargin/MenuVBox/Reset/Label.text = "Reset Data?"
		$Menu/MenuMargin/MenuVBox/Reset.visible = false
		$Menu/MenuMargin/MenuVBox/Reset.disabled = true
	
func doStuff():
	var dir = DirAccess.open("user://")
	if dir.file_exists("user://Launcher/Game/"+Shitfart.forkName+"/username.txt"):
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = false
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = true
		if (FileAccess.file_exists("user://Launcher/Game/"+Shitfart.forkName+"/username.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/"+Shitfart.forkName+"/username.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text = Thing
			Shitfart.username = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text = Shitfart.username
			var file = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/username.txt", FileAccess.WRITE)
			file.store_string(Shitfart.username)
			
		if (FileAccess.file_exists("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text = Thing
			Shitfart.uid = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text = Shitfart.username
			var file = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat", FileAccess.WRITE)
			file.store_string(Shitfart.uid)
		
		if (FileAccess.file_exists("user://Launcher/Game/fork.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/fork.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit.text = Thing
			Shitfart.fork = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit.text = Shitfart.fork
			var file = FileAccess.open("user://Launcher/Game/fork.txt", FileAccess.WRITE)
			file.store_string(Shitfart.fork)
			
		if (FileAccess.file_exists("user://Launcher/Game/forkName.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkName.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit.text = Thing
			Shitfart.forkName = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit.text = Shitfart.forkName
			var file = FileAccess.open("user://Launcher/Game/forkName.txt", FileAccess.WRITE)
			file.store_string(Shitfart.forkName)
			
		if (FileAccess.file_exists("user://Launcher/Game/forkTag.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkTag.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit.text = Thing
			Shitfart.forkTag = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit.text = Shitfart.forkTag
			var file = FileAccess.open("user://Launcher/Game/forkTag.txt", FileAccess.WRITE)
			file.store_string(Shitfart.forkTag)
		
		if (FileAccess.file_exists("user://Launcher/Game/forkExeName.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkExeName.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit.text = Thing
			Shitfart.forkExeName = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit.text = Shitfart.forkExeName
			var file = FileAccess.open("user://Launcher/Game/forkExeName.txt", FileAccess.WRITE)
			file.store_string(Shitfart.forkExeName)
				
		if (FileAccess.file_exists("user://Launcher/Game/forkZipName.txt")):
			var Thing = FileAccess.get_file_as_string("user://Launcher/Game/forkZipName.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit.text = Thing
			Shitfart.forkZipName = Thing
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit.text = Shitfart.forkZipName
			var file = FileAccess.open("user://Launcher/Game/forkZipName.txt", FileAccess.WRITE)
			file.store_string(Shitfart.forkZipName)
	else:
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = false
		$Menu/MenuMargin/MenuVBox/MultiBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/MultiBtn.visible = false
		$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl.visible = false
		$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl.visible = false
		Shitfart.fork = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkLbl/ForkEdit.text
		Shitfart.forkName = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkNameLbl/ForkNameEdit.text
		Shitfart.forkTag = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkTagLbl/ForkTagEdit.text
		Shitfart.forkExeName = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkExeName/ForkExeEdit.text
		Shitfart.forkZipName = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/ForkZipName/ForkZipEdit.text
		$Menu/MenuMargin/MenuVBox/ChkUpdtsBtn/Label.text = "Download Game!"
		
