extends Control

var fighters = [
    {"name": "LEO", "color": Color("#2878d0")},
    {"name": "RAPH", "color": Color("#d83232")},
    {"name": "MIKEY", "color": Color("#f18b25")},
    {"name": "DONNIE", "color": Color("#813fc4")}
]

func _ready():
    var bg = ColorRect.new()
    bg.color = Color("#101820")
    bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(bg)

    var title = Label.new()
    title.text = "CHOOSE YOUR FIGHTER"
    title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    title.add_theme_font_size_override("font_size", 42)
    title.anchor_left = 0.1
    title.anchor_right = 0.9
    title.anchor_top = 0.08
    title.anchor_bottom = 0.2
    add_child(title)

    for i in range(fighters.size()):
        var btn = Button.new()
        btn.text = fighters[i]["name"]
        btn.modulate = fighters[i]["color"]
        btn.anchor_left = 0.15 + i * 0.18
        btn.anchor_right = 0.31 + i * 0.18
        btn.anchor_top = 0.4
        btn.anchor_bottom = 0.58
        btn.pressed.connect(func(): select_fighter(i))
        add_child(btn)

func select_fighter(index):
    print("Selected: ", fighters[index]["name"])
