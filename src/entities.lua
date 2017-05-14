local STATECLASS = require("modules/gamestatesClass")

local ENTITIES = STATECLASS:set("ENTITIES")
local entities = {}

function ENTITIES.update(dt)
	for k,v in pairs(entities[GAMESTATES.getInt()]) do
		v:update(dt)
	end
end

function ENTITIES.draw()
	for k,v in pairs(entities[GAMESTATES.getInt()]) do
		v:draw()
	end
end

function ENTITIES.insert(tbl)
	entities[GAMESTATES.getInt()] = {}
	for k,v in pairs(tbl) do
		table.insert(entities[GAMESTATES.getInt()],v)
	end
end

function ENTITIES.append(ent)
	table.insert(entities[GAMESTATES.getInt()],1,ent)
end

function ENTITIES.remove(pos)
	table.remove(entities[GAMESTATES.getInt()],pos)
end

function ENTITIES.keypressed(key)
	for k,v in pairs(entities[GAMESTATES.getInt()]) do
		v:keypressed(key)
	end
end

function ENTITIES.keyreleased(key)
	for k,v in pairs(entities[GAMESTATES.getInt()]) do
		v:keyreleased(key)
	end
end

function ENTITIES.destroy()
	for k,v in pairs(entities[GAMESTATES.getInt()]) do
		v = nil
		k = nil
	end
end

function ENTITIES.getEntity(obj)
	for k,v in pairs(entities[GAMESTATES.getInt()]) do
		if v:getTag() == obj then
			return v
		end
	end
end

function ENTITIES.getList()
	return entities[GAMESTATES.getInt()]
end

return ENTITIES
