local STATECLASS = require("modules/gamestatesClass")

local GAME_INTRO = STATECLASS:set("GAME_INTRO")
local _groundY = 100
local int = 0

function GAME_INTRO.getInt()
	return int
end

function GAME_INTRO.preload()
	PRELOADER.newImage(assets.images,"playerSheet","assets/images/entities/player_sheet.png")
	PRELOADER.newImage(assets.images,"groundTop","assets/images/entities/ground_top.png")
	PRELOADER.newImage(assets.images,"toLimbo","assets/images/entities/toLimbo.png")
	PRELOADER.newImage(assets.images,"box","assets/images/entities/box.png")
	PRELOADER.newImage(assets.images,"stone","assets/images/entities/stone.png")
	PRELOADER.newImage(assets.images,"javelin","assets/images/entities/javelin.png")


	ASSETS.preload(function()
		local _player = ANIM8.newGrid(10,18,assets.images.playerSheet:getDimensions())
		
		local pIdleMax = 2
		local pRunMin = pIdleMax + 1
		local pRunMax = 6
		local pIdleSpeed = 0.5
		local pRunSpeed = 0.1
		local pJumpMin = pRunMax + 1
		local pJumpMax = 10
		local pJumpSpeed = 0.08
		local pFallMin = pJumpMax + 1
		local pFallMax = 13
		local pFallSpeed = 0.1

		anim_pIdle = ANIM8.newAnimation(_player('1-' .. pIdleMax,1),pIdleSpeed)
		anim_pRun = ANIM8.newAnimation(_player(pRunMin .. '-' .. pRunMax,1),pRunSpeed)
		anim_pJump = ANIM8.newAnimation(_player(pJumpMin .. '-' .. pJumpMax,1),pJumpSpeed)
		anim_pFalling = ANIM8.newAnimation(_player(pFallMin .. '-' .. pFallMax,1),pFallSpeed)
	end)
end

function GAME_INTRO.load()
	local player = PLAYER(anim_pIdle,16,(_groundY - assets.images.playerSheet:getHeight()),20,_groundY)
	local ground = GROUND(0,_groundY)
	ENTITIES.insert({player,ground})
end

function GAME_INTRO.update(dt)
	ENTITIES.update(dt)
end

function GAME_INTRO.draw()
	love.graphics.setBackgroundColor(0,0,0,255)
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(assets.images.toLimbo,
		settings.gameWidth - 38,
		_groundY - assets.images.toLimbo:getHeight())
	ENTITIES.draw()

	MISC.print("Press R to Restart \n A and D to Move \n W to Jump")
end

function GAME_INTRO.keypressed(key)
	ENTITIES.keypressed(key)
end

function GAME_INTRO.keyreleased(key)
	ENTITIES.keyreleased(key)
end

function GAME_INTRO.exit()
	ENTITIES.destroy()
end

function GAME_INTRO.goal()
	local p = ENTITIES.getEntity("PLAYER")
	return p.x > settings.gameWidth
end

return GAME_INTRO
