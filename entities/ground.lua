local GROUND = OBJ:extend()
local tag = "GROUND"

function GROUND:new(x,y,w,h)
	self.x = x
	self.y = y
	self.w = w or settings.gameWidth
	self.h = h or settings.gameHeight

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
	
	for i = (self.x/32), (self.w/32) - 1 do
		local tileW = 32
		local groundX = i * tileW
		local groundY = self.y - 6
		love.graphics.draw(assets.images.groundTop,
			groundX, groundY)
	end
end

function GROUND:collision()
	local p = ENTITIES.getEntity("PLAYER")
	local px = p.x
	local py = p.y
	local pw = p.w
	local ph = p.h

	return px >= self.x and px <= self.x + self.w and --within range
		py + ph >= self.y --collision
end

function GROUND:overrideCollision()
	local p = ENTITIES.getEntity("PLAYER")
	local px = p.x
	local py = p.y
	local pw = p.w
	local ph = p.h

	return py + ph > self.y
end

function GROUND:keypressed(key)

end

function GROUND:keyreleased(key)

end

function GROUND:getTag()
	return tag
end

return GROUND
