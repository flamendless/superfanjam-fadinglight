local STATECLASS = require("modules/gamestatesClass")

local LEVEL_1 = STATECLASS:set("LEVEL_1")

function LEVEL_1.preload()
	print(1)
end

function LEVEL_1.load()

end

function LEVEL_1.update(dt)

end

function LEVEL_1.draw()

end

function LEVEL_1.keypressed(key)

end

function LEVEL_1.keyreleased(key)

end

function LEVEL_1.exit()

end

GAMESTATES.insertLevel(LEVEL_1)

return LEVEL_1
