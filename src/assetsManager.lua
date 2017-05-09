local ASSETS = {}

local finished = false
assets = {}
assets.images = {}
assets.audio = {}


function ASSETS.preload(func)
	local func = func or function() end
	PRELOADER.start(function()
		for k,v in pairs(assets.images) do
			v:setFilter("nearest","nearest",1)
		end
		for k,v in pairs(assets.audio) do
			v:setLooping(false)
		end
		ASSETS.animationLoad(func)
		finished = true
		GAMESTATES.load()
	end)
	font = fonts.jamboree_8
	
end


function ASSETS.update(dt)
	if not finished then
		PRELOADER.update()
	end
end

function ASSETS.setState(state)
	finished = state
end

function ASSETS.getState()
	return finished
end

function ASSETS.draw()
	if not finished then
		love.graphics.setColor(255,255,255,255)
		love.graphics.setFont(font)
		love.graphics.print("Loading",
			MISC.centerWidth() - font:getWidth("Loading")/2,
			MISC.centerHeight() - font:getHeight("Loading")/2
		)
	end
end

function ASSETS.animationLoad(func)
	func = func or function() end
	func()
end

return ASSETS
