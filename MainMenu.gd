extends Control

func _ready():
    var bg = ColorRect.new()
    bg.color = Color("#101820")
    bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(bg)

    var title = Label.new()
    title.text = "SHELL KOMBAT"
    title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    title.add_theme_font_size_override("font_size", 64)
    title.add_theme_color_override("font_color", Color("#f5c542"))
    title.anchor_left = 0.1
    title.anchor_right = 0.9
    title.anchor_top = 0.18
    title.anchor_bottom = 0.35
    add_child(title)

    var subtitle = Label.new()
    subtitle.text = "THE ULTIMATE NINJA FIGHT"
    subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    subtitle.add_theme_font_size_override("font_size", 20)
    subtitle.add_theme_color_override("font_color", Color.WHITE)
    subtitle.anchor_left = 0.1
    subtitle.anchor_right = 0.9
    subtitle.anchor_top = 0.36
    subtitle.anchor_bottom = 0.43
    add_child(subtitle)

    create_button("START FIGHT", 0.52)
    create_button("OPTIONS", 0.65)
    create_button("EXIT", 0.78)

func create_button(text_value: String, y: float):
    var btn = Button.new()
    btn.text = text_value
    btn.anchor_left = 0.3
    btn.anchor_right = 0.7
    btn.anchor_top = y
    btn.anchor_bottom = y + 0.09
    btn.add_theme_font_size_override("font_size", 26)
    add_child(btn)
