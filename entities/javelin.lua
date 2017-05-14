local JAVELIN = OBJ:extend()
local tag = "JAVELIN"

function JAVELIN:new(x,y,goalX,goalY,spd)
	self.w,self.h = assets.images.javelin:getDimensions()
	self.x = x
	self.y = y
	self.gx = goalX
	self.gy = goalY
	self.spd = spd
	self.dir = self.x < self.gx and 1 or -1
	self.origX,self.origY = self.w/2, self.h/2
	self.angle = math.atan2((self.gy + self.y), (self.gx + self.x))
	self.timer = 0
	self:load()
end

function JAVELIN:load()
end

function JAVELIN:update(dt)
	self.timer = self.timer + 1 * dt
	if self.x ~= self.gx then
		self.x = self.x + (self.dir * self.spd ) * dt
	end
	if self.y ~= self.gy then
		self.y = self.y + self.spd * dt
	end
	self:collision(dt)
end

function JAVELIN:collision(dt)
	local p = ENTITIES.getEntity("PLAYER")
	return MISC.collision(p.x,p.y,p.w,p.h,
		self.x,self.y,self.w,self.h)
end

function JAVELIN:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(assets.images.javelin, self.x, self.y, self.angle,1,1,self.origX,self.origY)
end

function JAVELIN:keypressed(key)

end

function JAVELIN:keyreleased(key)

end

function JAVELIN:getTag()
	return tag
end

return JAVELIN
