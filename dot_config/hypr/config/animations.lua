hl.curve("suave", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = 5,
	bezier = "suave",
	style = "slidefadevert -100%",
})
