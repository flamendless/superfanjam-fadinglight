function love.conf(t)
	t.window.fullscreen = false
	t.window.title = "superfanjam"
	t.window.width = 1280 - 128
	t.window.height = 640 - 64
	io.stdout:setvbuf("no")
	postJam = false
end
