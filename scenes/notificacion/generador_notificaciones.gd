extends Control
class_name NotificationGenerator

const NOTIFICATION_SCENE = preload("uid://c5pfutdg4tr2x")

func generate(notificatinon_key: String):
	var new_notification: Notification = NOTIFICATION_SCENE.instantiate()
	new_notification.notification_key = notificatinon_key
	
	self.add_child(new_notification)
	new_notification.global_position = Vector2(randf_range(20, 1300), randf_range(0, 600))
	print("moved to: %s" % new_notification.position)
	
	AudioManager.play_notification()
	
	new_notification.load_data()
	DataResources.notifications_data_map.erase(notificatinon_key)
