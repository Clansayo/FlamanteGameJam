extends Control

const NOTIFICATION_SCENE = preload("uid://c5pfutdg4tr2x")

func generate(notificatinon_key: String):
	var new_notification: Notification = NOTIFICATION_SCENE.instantiate()
	new_notification.notification_key = notificatinon_key
	new_notification.load_data()
	
	self.add_child(new_notification)
