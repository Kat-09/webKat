@tool
extends EditorPlugin

func _enable_plugin():
	# The autoload can be a scene or script file.
	add_autoload_singleton("RmDir", "res://addons/remove_directory/rmdir.gd")


func _disable_plugin():
	remove_autoload_singleton("RmDir")
