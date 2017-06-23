extends Sprite

var bug_direction = Vector2(0.0, 1.0)
var bug_size
var bug_state = "walking"

func _ready():
	bug_size = get_node(".").get_texture().get_size()	
	print(bug_size)

func _on_Area2D_input_event( viewport, event, shape_idx ):
	if (event.is_action_pressed("click_button")): 
		#if (event.button_index == BUTTON_LEFT):
		if bug_state != "flying":
			print("Dentro de mi!")
			get_node("animation_fly").play("fly")
			#get_node("/root/game").change_direction("random")
			bug_state = "flying"
			
func fly_stop():
	get_node("animation_fly").stop()
