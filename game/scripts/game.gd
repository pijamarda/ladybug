extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bug_direction = Vector2(0.0, 1.0)
var bug_speed = 200
var max_width = 0
var max_height = 0 
var bug_size = Vector2(1.0, 1.0)
var screen_size
var time_left = 2

func _ready():
	set_process(true)
	screen_size = get_viewport_rect().size
	bug_size = get_node("bug").get_texture().get_size()
	print(screen_size)
	print(bug_size)

func _process(delta):
	var bug_pos = get_node("bug").get_pos()
	if (bug_pos.x < (0 + (bug_size.x / 2))):
		change_direction("right")
	elif (bug_pos.x > (screen_size.x - (bug_size.x / 2))):
		change_direction("left")
	elif (bug_pos.y < (0 + (bug_size.y / 2))):
		change_direction("down")
	elif (bug_pos.y > (screen_size.y - (bug_size.y/2) )):
		change_direction("up")
	
	#get_node("bug").set_pos(Vector2(0+128/2,800-128/2))
	time_left = time_left - delta
	if (time_left < 0):
		change_direction("random")
		time_left = 3
	bug_pos += bug_direction * bug_speed * delta
	get_node("bug").set_pos(bug_pos)
	
func change_direction(var dir):
	var bug_pos = get_node("bug").get_pos()
	var rnum = 0
	var nueva_dir = dir
	if (dir == "random"):
		rnum = randi()%11+1
		print(rnum)
		if (rnum < 3):
			nueva_dir = "left"
		elif (rnum < 6):
			nueva_dir = "right"
		elif (rnum < 9):
			nueva_dir = "up"
		elif (rnum < 12):
			nueva_dir = "down"
		
	if (nueva_dir == "left"):
		bug_direction = Vector2(-1.0, 0.0)
		get_node("bug").set_rotd( 270 )
	elif (nueva_dir == "right"):
		bug_direction = Vector2(1.0, 0.0)
		get_node("bug").set_rotd( 90 )
	elif (nueva_dir == "down"):
		bug_direction = Vector2(0.0, 1.0)
		get_node("bug").set_rotd( 0 )
	elif (nueva_dir == "up"):
		bug_direction = Vector2(0.0, -1.0)
		get_node("bug").set_rotd( 180 )
	
		