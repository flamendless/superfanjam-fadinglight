local BOX = OBJ:extend()

local tag = "BOX"

function BOX:new(x,y,w,h)
	self.x = x
	self.y = y
	self.w = w or 32
	self.h = h or 32
	self.force = 20
	self.dir = 0
	self:load()
end

function BOX:load()
end

function BOX:update(dt)
	self:collision(dt)
end

function BOX:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(assets.images.box,self.x,self.y)
end

function BOX:collision(dt)
	local p = ENTITIES.getEntity("PLAYER")
	local e = love.keyboard.isDown(keybindings.KEY_ACTION)
	local left = love.keyboard.isDown(keybindings.KEY_LEFT)
	local right = love.keyboard.isDown(keybindings.KEY_RIGHT)
	local gap = 8
	if e and right then
		if p.x < self.x and p.x >= self.x - gap then
			p.x = self.x - gap
			self.dir = 1
		end
	elseif e and left then
		if p.x >= self.x + self.w and p.x < self.x + self.w + gap then
			self.dir = -1
			p.x = self.x + self.w + 1
		end
	else
		self.dir = 0
	end
	
	self.x = self.x + (self.dir * self.force) * dt
end

function BOX:keypressed(key)

end

function BOX:keyreleased(key)

end

function BOX:getTag()
	return tag
end

return BOX
