local GAMESTATES = {}

insertTable(GAMESTATES)

function GAMESTATES.initialize()
	SPLASH = require("states/splash")
	TITLE = require("states/title")

	GAME = require("states/game")
	OPTIONS = require("states/options")
	ABOUT = require("states/about")
	CREDITS = require("states/credits")
	EXIT = require("states/exit")

end

function GAMESTATES.start(first)
	local first = first or SPLASH
	STATE = first
	GAMESTATES.preload()
end

function GAMESTATES.preload()
	STATE.preload()
end

function GAMESTATES.load()
	STATE.load()
end

function GAMESTATES.update(dt)
	if ASSETS.getState() == false then
		ASSETS.update(dt)
	else
		STATE.update(dt)
	end
end

function GAMESTATES.draw()
	if ASSETS.getState() == false then
		ASSETS.draw()
	else
		STATE.draw()
	end
end

function GAMESTATES.keypressed(key)
	STATE.keypressed(key)
end

function GAMESTATES.keyreleased(key)
	STATE.keyreleased(key)
end

function GAMESTATES.setState(newState)
	if settings.debug == true then
		print(STATE:getTag() .. " to " .. newState:getTag())
	end
	STATE.exit()
	STATE = newState
	STATE.preload()
end

function GAMESTATES.getState()
	return STATE.getTag()
end

return GAMESTATES
