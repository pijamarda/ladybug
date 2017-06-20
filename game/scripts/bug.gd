extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bug_direction = Vector2(0.0, 1.0)
var bug_speed = 200
var max_width = 0
var max_height = 0 
var bug_size = Vector2(1.0, 1.0)
var screen_size


func _ready():
	
	set_process(true)
	screen_size = get_viewport_rect().size
	bug_size = get_node(".").get_texture().get_size()
	print(screen_size)
	print(bug_size)

#func _on_Area2D_input_event( viewport, event, shape_idx ):
#	if (event.type == InputEvent.MOUSE_BUTTON): 
#		print("Dentro de mi!")
		

#func _process(delta):
#	var bug_pos = get_node(".").get_pos()
#	if (bug_pos.x < (0 + (bug_size.x / 2))):
#		change_direction("right")
#	elif (bug_pos.x > (screen_size.x - (bug_size.x / 2))):
#		change_direction("left")
#	elif (bug_pos.y < (0 + (bug_size.y / 2))):
#		change_direction("down")
#	elif (bug_pos.y > (screen_size.y - bug_size.y )):
#		print(bug_pos.y)
#		print("arriba")
#		print(get_viewport_rect().size)
#		change_direction("up")
#	bug_pos += bug_direction * bug_speed * delta
#	#get_node(".").set_pos(bug_pos)
#	
#func change_direction(var dir):
#	
