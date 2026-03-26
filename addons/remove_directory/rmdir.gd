extends Node

func rmdir(directory: String) -> void:
	for file in DirAccess.get_files_at(directory):
		DirAccess.remove_absolute(directory.path_join(file))
	for dir in DirAccess.get_directories_at(directory):
		rmdir(directory.path_join(dir))
	DirAccess.remove_absolute(directory)
