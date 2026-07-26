extends Node
## Este objeto está pendiente de ir revisando si las notificaciones son triggereadas o no
## Periodicamente

var timer_refresh_rate: Timer

signal trigger_notification(notification_key: String)

func _ready() -> void:
	timer_refresh_rate = Timer.new()
	timer_refresh_rate.wait_time = 2.3215
	timer_refresh_rate.one_shot = false
	timer_refresh_rate.timeout.connect(check)
	self.add_child(timer_refresh_rate)
	
	timer_refresh_rate.start()

func check():
	#print("Boss points: %s" % CurrencyManager.get_boss_points())
	var is_more_than: bool = false
	var value: int = -1
	for notification_data_key: String in DataResources.notifications_data_map.keys():
		var notification_data: Dictionary = DataResources.notifications_data_map[notification_data_key]
		if notification_data.trigger.has("more_points_than"):
			is_more_than = true
			value = notification_data.trigger.more_points_than
		elif notification_data.trigger.has("less_points_than"):
			is_more_than = false
			value = notification_data.trigger.less_points_than
		else:
			print("ERROR: notification_data erroneo en EventNotificationManager")
			return
		
		if notification_data.type == "boss":
			if is_more_than:
				if CurrencyManager.get_boss_points() > value:
					trigger_notification.emit(notification_data_key)
			else:
				if CurrencyManager.get_boss_points() <= value:
					trigger_notification.emit(notification_data_key)
		else:
			if is_more_than:
				if CurrencyManager.get_earth_points() > value:
					trigger_notification.emit(notification_data_key)
			else:
				if CurrencyManager.get_earth_points() <= value:
					trigger_notification.emit(notification_data_key)
