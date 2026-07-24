extends Object
class_name FileManager

## Carga un fichero json en un diccionario/array y lo devuelve
static func load_json(file_path: String) -> Variant: # variant porque puede devolver tanto un diccionario como una lista por el json
	var file: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	if file: # No es null
		return JSON.parse_string(file.get_as_text())
	return null
