extends Node2D

# CONSTANTS
var TIME_FLY = 5

var bug_direction = Vector2(0.0, 1.0)
var bug_speed = 100
var max_width = 0
var max_height = 0 
var bug_size = Vector2(1.0, 1.0)
var screen_size
var time_left = 2
var bug_state
var time_fly_left = TIME_FLY

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
	
	bug_state = get_node("bug").bug_state
	
	if bug_state == "flying":
		time_fly_left = time_fly_left - delta
		if (time_fly_left < 0):
			get_node("bug").fly_stop()
			time_fly_left = TIME_FLY
			get_node("bug").bug_state = "walking"
		
	else:
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
		bug_direction = random_direction()
		print(bug_direction)
		var new_angle_rad = atan2(bug_direction.x, bug_direction.y)
		print(new_angle_rad)
		get_node("bug").set_rot(new_angle_rad)
		
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
		
func random_direction():
	randomize()
	var nueva_x = 0
	var nueva_y = 0
	var rnum1 = rand_range(1,4)
	var rnum2 = rand_range(1,4)
	if rnum1 < 2:
		nueva_x = 0
	else:
		nueva_x = 1
	if rnum2 < 2:
		nueva_x = -nueva_x
	rnum1 = rand_range(1,4)
	rnum2 = rand_range(1,4)
	if rnum1 < 2:
		nueva_y = 0
	else:
		nueva_y = 1
	if rnum2 < 2:
		nueva_y = -nueva_y
	return Vector2(nueva_x, nueva_y)