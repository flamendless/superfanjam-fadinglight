require("src/modules").load()

math.random(os.time())
function love.load()
	GAMESTATES.start(MAIN_MENU)
end

function love.update(dt)
	GAMESTATES.update(dt)
end

function love.draw()
	love.graphics.push()
	love.graphics.translate(0,settings.translateY)
	love.graphics.scale(settings.gameRatio)
	GAMESTATES.draw()
	if settings.debug == true and settings.debug_draw == true then
		love.graphics.setColor(255,0,0,255)
		love.graphics.rectangle("line",0,0,settings.gameWidth,settings.gameHeight)
	end
	love.graphics.pop()
end

function love.keypressed(key)
	GAMESTATES.keypressed(key)

	if key == "space" then
		settings.debug_draw = not settings.debug_draw
	end
end

function love.keyreleased(key)
	GAMESTATES.keyreleased(key)
end
