local STONE = OBJ:extend()
local tag = "STONE"

function STONE:new(x,y)
	self.w, self.h = assets.images.stone:getDimensions()
	self.x = x
	self.y = y
	self.rot = 0
	self.spd = 60
	self:load()
end

function STONE:load()
end

function STONE:update(dt)
	if self.x > -64 then
		self.x = self.x - self.spd * dt
		self.rot = self.rot + (-self.spd/2) * dt
	end
	self:collision(dt)
	ENTITIES.getEntity("PLAYER"):setDeath(self:collision(dt))
end

function STONE:collision(dt)
	local p = ENTITIES.getEntity("PLAYER")
	local sx,sy = self.x - self.w/2, self.y - self.h/2
	return p.x + p.w >= sx and p.x + p.w <= sx + self.w
	and p.y + p.h >= sy
end

function STONE:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(assets.images.stone, self.x,self.y,self.rot,
		1,1,self.w/2,self.h/2)
end

function STONE:keypressed(key)

end

function STONE:keyreleased(key)

end

function STONE:getTag()
	return tag
end

return STONE
