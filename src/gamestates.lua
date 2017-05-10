local GAMESTATES = {}

insertTable(GAMESTATES)
local levels = {}
local maxLevels = 2

function GAMESTATES.initialize()
	SPLASH = require("states/splash")
	TITLE = require("states/title")

	GAME_INTRO = require("states/gameIntro")
	GAMESTATES.levelLoad()

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
	return STATE:getTag()
end

function GAMESTATES.levelLoad()
	local name = "LEVEL_"
	local dir = "levels"

	for k, file in ipairs(love.filesystem.getDirectoryItems(dir)) do
		local level = string.sub(file,1,-5)
		lvl = require(dir .. "/" .. level)
	end
end

function GAMESTATES.getLevels()
	for k,v in pairs(levels) do
		print(k,v.tag)
	end
end

function GAMESTATES.insertLevel(lvl)
	table.insert(levels,lvl)
end

function GAMESTATES.nextLevel()
	local current = GAMESTATES.getState()
	local nextLevel = string.sub(current,1,-2)
	local reversed = string.reverse(current)
	local int = string.sub(reversed,1,1)
	local nextInt = tonumber(int) + 1
	if nextInt < maxLevels then
		GAMESTATES.setState(nextLevel .. nextInt)
	end
	--print(nextLevel .. nextInt)
end


return GAMESTATES
