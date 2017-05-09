local PLAYER = OBJ:extend()

local ground = {}
ground.y = 82

function PLAYER:new(anim,x,y,spd)
	self.x = x or 0
	self.y = y or 0
	self.h = 18
	self.w = 10
	self.curAnim = anim
	self.animations = {
		anim_pIdle,
		anim_pRun,
		anim_pJump
	}
	self.isMoving = false
	self.isJumping = false
	self.onFloor = true

	self.dir = 1
	self.hspd = 0
	self.spd = spd or 10
	self.initSpd = self.spd
	self.maxSpd = self.spd * 3
	self.accel = 60
	self.deccel = 100

	self.vspd = 0
	self.jspd = (self.spd * 2)
	self.jPower = 0.5
	self.jMinPower = self.jPower
	self.jMaxPower = 3
	self.jAccel = 1
	self.grav = 0.9

	self.overrideTimer = false

	self:load()
end

function PLAYER:load()
	GAME.insertEntities(self)

	oTimer = TIMER.new()
	oTimer:every(2, function()
		self.hspd = 0
	end)
end

function PLAYER:update(dt)
	self.curAnim:update(dt)
	
	self:updateSprite(dt)

	self:collisions(dt)
	self:movement(dt)
	self:jumping(dt)
	self:overridePhysics(dt)
end

function PLAYER:draw()
	love.graphics.setColor(255,255,255,255)
	self.curAnim:draw(assets.images.playerSheet,
		self.x,
		self.y)
end

function PLAYER:keypressed(key)
	if key == keybindings.KEY_LEFT then
		self.curAnim = anim_pRun
		self.hspd = -1
		if self.dir == 1 then
			self.dir = -1
			self:changeSprite()
		end
	elseif key == keybindings.KEY_RIGHT then
		self.curAnim = anim_pRun
		self.hspd = 1
		if self.dir == -1 then
			self.dir = 1
			self:changeSprite()
		end
	end

	if key == keybindings.KEY_UP then
		if self.onFloor == true then
			self.isJumping = true
			self.curAnim = anim_pJump
			self.vspd = -1
		end
	end
end

function PLAYER:keyreleased(key)
	if key == keybindings.KEY_UP then
	end
end

function PLAYER:movement(dt)
	local left = love.keyboard.isDown(keybindings.KEY_LEFT)
	local right = love.keyboard.isDown(keybindings.KEY_RIGHT)
	if left == false and right == false then
		self.isMoving = false
		self.overrideTimer = true
	else
		self.isMoving = true
		self.overrideTimer = false
	end

	if self.isMoving then
		if self.spd < self.maxSpd then
			self.spd = self.spd + self.accel * dt
		end
	else
		if self.spd > self.initSpd then
			self.spd = self.spd - self.deccel * dt
			if self.initSpd == math.floor(self.spd) then
				self.hspd = 0
			end
		end
	end

	self.x = self.x + (self.hspd * self.spd) * dt
end

function PLAYER:jumping(dt)
	local up = love.keyboard.isDown(keybindings.KEY_UP)
	if up then
		if self.onFloor == true then
			if self.jPower < self.jMaxPower then
				self.jPower = self.jPower + self.jAccel * dt
			end
		end
	else
		if self.onFloor == false then
			self.vspd = 1
		else
			self.vspd = 0
		end
	end

	if self.vspd ~= 0 then
		self.y = self.y + (self.vspd * self.jspd) * dt
	end
end

function PLAYER:changeSprite()
	for k,v in pairs(self.animations) do
		v:flipH()
	end
end

function PLAYER:updateSprite(dt)
	if self.onFloor == true then
		if self.isMoving == false then
			self.curAnim = anim_pIdle
		else
			self.curAnim = anim_pRun
		end
		anim_pJump:gotoFrame(1)
	else
		self.curAnim = anim_pJump
		if self.curAnim == anim_pJump then
			if anim_pJump.position == anim_pJump:getTotalFrames() then
				anim_pJump:gotoFrame(anim_pJump:getTotalFrames())
			end
		end
	end
end

function PLAYER:overridePhysics(dt)
	if self.overrideTimer == true then
		oTimer:update(dt)
	end
end

function PLAYER:collisions(dt)
	if self.y + self.h >= ground.y then
		self.isJumping = false
		self.onFloor = true
	else
		self.onFloor = false
	end
end

return PLAYER
