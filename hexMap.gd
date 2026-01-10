extends Node


@onready var map : TileMapLayer = $TileMapLayer 
@onready var uiContainer = $"../UI Layer/MainContainer"
var selectedColor : int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	uiContainer.setBuilding.connect(setSelectedBuilding)
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setSelectedBuilding(buildingID: int) -> void:
	selectedColor = buildingID

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#get mouse position, convert to hex
		var mouse_global : Vector2 = event.position
		var mouse_local := map.to_local(mouse_global)
		var hex := map.local_to_map(mouse_local)
		
		
		#set hex to orange for now
		map.set_cell(hex, 4, Vector2i(selectedColor,0), 0 )
		print("Clicked hex: ", hex)
