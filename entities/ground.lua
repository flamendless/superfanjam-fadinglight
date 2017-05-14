local GROUND = OBJ:extend()
local tag = "GROUND"

function GROUND:new(x,y,w,h,tile)
	self.x = x
	self.y = y
	self.w = w or settings.gameWidth * 2
	self.h = h or settings.gameHeight
	self.tile = tile or 16
	self:load()
end

function GROUND:load()
end

function GROUND:update(dt)
	self:collision()
	self:overrideCollision()
end

function GROUND:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)

	for i = 0, (self.w/self.tile) -1  do
		local groundX = i * self.tile
		local groundY = self.y - 4
		love.graphics.draw(assets.images.groundTop,
			groundX, groundY)
	end
end

function GROUND:collision()
	local p = ENTITIES.getEntity("PLAYER")

	return p.x >= self.x and p.x + p.w <= self.x + self.w --within range
		and p.y + p.h >= self.y --collision
end

function GROUND:overrideCollision()
	local p = ENTITIES.getEntity("PLAYER")

	return p.y + p.h >= self.y
end

function GROUND:keypressed(key)

end

function GROUND:keyreleased(key)

end

function GROUND:getTag()
	return tag
end

return GROUND
