extends PanelContainer

signal setBuilding(buildingID: int)

@onready var container: HBoxContainer = $CenterContainer/HBoxContainer
var options : Array[int] = [0,1,2,3,4,5]

var ColorOptions : Array[Color] = [
	Color("#e6ddd9"),
	Color("#ff7f27"),
	Color("#22b14c"),
	Color("#00a2e8"),
	Color("#3f48cc"),
	Color("#a349a4"),
]



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generateButtonsOfOptions()
	
	
func generateButtonsOfOptions() -> void:
	for o in options:
		var button = Button.new()
		button.custom_minimum_size = Vector2(44, 44)
		button.focus_mode = Control.FOCUS_NONE
		button.tooltip_text = str(o)
		
		var style := StyleBoxFlat.new()
		style.bg_color = ColorOptions[o]
		style.corner_radius_top_left = 8
		style.corner_radius_top_right = 8
		style.corner_radius_bottom_left = 8
		style.corner_radius_bottom_right = 8
		button.add_theme_stylebox_override("normal", style)
		button.add_theme_stylebox_override("hover", style)
		button.add_theme_stylebox_override("pressed", style)
		
		
		
		button.pressed.connect(func():
			setBuilding.emit(o)
			
		)

		container.add_child(button)

	
