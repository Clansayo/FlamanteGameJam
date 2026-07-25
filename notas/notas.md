
## Entidades:
	
#### Notificaciones

- Noticias
- Jefe exigencias

#### Decisiones

Las decisiones serán un nodo `Decision` de UI de godot compuesto de una lista dibujada horizontalmente de nodos `Opcion`.

#### Opciones

Una opción será un objeto que contiene en un diccionario su informacion y dibuja su título.

El diccionario sale de un json que tiene la siguiente forma:

Ejemplo:
```json
{
	"ID_OPCION": {
		"tittle": String,
		"effect_visibility": bool,
		"effect": {
			"add_dollars": 300,
			"add_emails": 10,
		},
		"cost": int 
	},

	"ID_OPCION_2_EJEMPLO_DE_VERDAD": {
		"effect_visibility": true,
		"effect": {
			"add_dollars": -300,
			"add_emails": 2,
			"add_dollars_modifier": 2
		},
		"cost": 25
	},
	...
}
```

Recordar que un efecto es un diccionario con diferentes efectos y valor del efecto.

#### Notificaciones

Te llegan noticias del mundo o comentarios de tu jefe sobre los acontecimientos de la partida.

Esto es un json que se carga en un nodo UI rellando con la info.

```json
{
	"NOTIFICACION_ID": {
		"tipo": String,
		"imgen": String (el nombre de la imagen),
		"mensaje": ,
		"trigger": {
			"less_boss_happiness_than": 10,
			"more_planet_points_than": 50
		} 
	}
}
```

La imagen es una cosa opcional y deben estar en una carpeta especificada. Así simplemente el código hace un

```java
load_image_from_path("/imagenes_notificaciones/" + nombre_imagen);
```

\* Este código me lo he inventado que flipas pero para que se entiende.

\* Los mensajes deberían ser keys rollo NOTIFICACION_MENSAJE_JEFE_1 para que en texto se encuentre en el propio csv con las traducciones.
