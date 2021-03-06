local MODULES = {}

local modules = {}

function MODULES.load()
	PRELOADER = require("modules/love-loader/love-loader")
	LOVEDEBUG = require("modules/LOVEDEBUG/lovedebug")
	TIMER = require("modules/hump/timer")
	ANIM8 = require("modules/anim8/anim8")
	OBJ = require("modules/classic/classic")
	
	PLAYER = require("entities/player")
	GROUND = require("entities/ground")
	BOX = require("entities/box")
	STONE = require("entities/stone")
	JAVELIN = require("entities/javelin")

	DEFAULTS = require("src/defaults")
	GAMESTATES = require("src/gamestates")
	ASSETS = require("src/assetsManager")
	MISC = require("modules/miscFunctions")
	ENTITIES = require("src/entities")


	MODULES.initialize()
end

function MODULES.initialize()
	for k,v in pairs(modules) do
		v.initialize()
	end
end

function insertTable(arg)
	table.insert(modules,arg)
end

return MODULES
