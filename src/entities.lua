local STATECLASS = require("modules/gamestatesClass")

local ENTITIES = STATECLASS:set("ENTITIES")
local entities = {}

function ENTITIES.insert(obj)
	table.insert(entities,obj)
end

function ENTITIES.get()
	return entities
end

return ENTITIES
