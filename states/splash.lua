local STATECLASS = require("modules/gamestatesClass")

local SPLASH = STATECLASS:set("SPLASH")

local timer_flag = false

function SPLASH.preload()
	PRELOADER.newImage(assets.images,"splash_sheet","assets/images/splash/splash-sheet.png")

	ASSETS.preload(function()
		local _splash = ANIM8.newGrid(64,32,assets.images.splash_sheet:getDimensions())
		local max = 70
		anim_splash = ANIM8.newAnimation(_splash('1-' .. max,1),0.1,
		function()
			anim_splash:pauseAtEnd()
			timer_flag = true
		end)
	end)
end

function SPLASH.load()
	splashTimer = TIMER.new()
	splashTimer:after(3, function()
		GAMESTATES.setState(TITLE)
	end)
end

function SPLASH.update(dt)
	if timer_flag == true then
		splashTimer:update(dt)
	end
	anim_splash:update(dt)
end

function SPLASH.draw()
	love.graphics.setColor(255,255,255,255)
	anim_splash:draw(assets.images.splash_sheet,
		MISC.centerWidth(),MISC.centerHeight(),
		0,3,3,
		MISC.offsetWidth(true,70,assets.images.splash_sheet),
		MISC.offsetHeight(true,1,assets.images.splash_sheet)
	)
end

function SPLASH.keypressed(key)
	GAMESTATES.setState(TITLE)
end

function SPLASH.keyreleased(key)
end

function SPLASH.exit()
	ASSETS.setState(false)
end


return SPLASH
