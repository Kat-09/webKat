extends Control


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	Shitfart._shitFartInit()
	
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://Launcher/Game/"+Shitfart.forkName+"/"):
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = false
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = true
		Shitfart.uid = gen_unique_string(16)
		if (FileAccess.file_exists("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat")):
			var UID = FileAccess.get_file_as_string("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text = UID
			Shitfart.uid = UID
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text = Shitfart.uid
			var file = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/uid.dat", FileAccess.WRITE)
			file.store_string(Shitfart.uid)

		if (FileAccess.file_exists("user://Launcher/Game/"+Shitfart.forkName+"/username.txt")):
			var Username = FileAccess.get_file_as_string("user://Launcher/Game/"+Shitfart.forkName+"/Username.txt")
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text = Username
			Shitfart.username = Username
		else:
			$Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text = Shitfart.username
			var file = FileAccess.open("user://Launcher/Game/"+Shitfart.forkName+"/Username.txt", FileAccess.WRITE)
			file.store_string(Shitfart.username)
		
			
	else:
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = false
		$Menu/MenuMargin/MenuVBox/MultiBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/MultiBtn.visible = false
		$Menu/MenuMargin/MenuVBox/ChkUpdtsBtn/Label.text = "Download Game!"
		dir.make_dir_recursive("user://Launcher/Game/"+Shitfart.forkName+"/")

func _on_text_edit_text_changed() -> void:
	Shitfart.username = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UsernameLbl/UsernameEdit.text
	if Shitfart.uid != "":
		Shitfart.uid = $Menu/MenuMargin/OptionsVBox/HUD/MarginContainer/VBoxContainer/UidLbl/UidEdit.text

var ascii_letters_and_digits = "ABCDEF0123456789"
func gen_unique_string(length: int) -> String:
	var result = ""
	for i in range(length):
		result += ascii_letters_and_digits[randi() % ascii_letters_and_digits.length()]
	return "0x" + result
