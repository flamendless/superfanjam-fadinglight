local GROUND = OBJ:extend()

function GROUND:new(x,y,w,h)
	self.x = x
	self.y = y
	self.w = w
	self.h = h


	self:load()
end

function GROUND:load()
	ENTITIES.insert(self)
end

function GROUND:update(dt)

end

function GROUND:draw()
	love.graphics.setColor(255,0,0,255)
	love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
end

function GROUND:keypressed(key)

end

function GROUND:keyreleased(key)

end

return GROUND
