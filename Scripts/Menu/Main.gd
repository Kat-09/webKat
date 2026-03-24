extends Control


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	var dir = DirAccess.open("user://")
	if dir.dir_exists("user://Launcher/Game/"):
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = false
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = true
	else:
		$Menu/MenuMargin/MenuVBox/StartBtn.disabled = true
		$Menu/MenuMargin/MenuVBox/StartBtn.visible = false
		$Menu/MenuMargin/MenuVBox/ChkUpdtsBtn/Label.text = "Download Game!"
