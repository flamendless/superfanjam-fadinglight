local DEFAULTS = {}

insertTable(DEFAULTS)

function DEFAULTS.initialize()
	settings = {}
	settings.debug = true
	settings.debug_draw = false
	settings.screenWidth = love.graphics.getWidth()
	settings.screenHeight = love.graphics.getHeight()
	settings.gameWidth = 256
	settings.gameHeight = 128
	settings.gameRatio = math.min(
			(settings.screenWidth/settings.gameWidth),
			(settings.screenHeight/settings.gameHeight)
		)
	settings.translateX = (settings.screenWidth - settings.gameWidth)/2
	settings.translateY = ((settings.screenHeight - settings.gameHeight)/2) / settings.gameRatio




	fonts = DEFAULTS.fonts()
	keybindings = DEFAULTS.keybindings()
end

function DEFAULTS.fonts()
	local f = {}
	f.jamboree_8 = love.graphics.newFont("assets/fonts/jamboree.ttf",8)
	f.jamboree_12 = love.graphics.newFont("assets/fonts/jamboree.ttf",12)

	for k,v in pairs(f) do
		v:setFilter("nearest","nearest",1)
	end

	return f
end

function DEFAULTS.keybindings()
	local k = {}
	k.KEY_LEFT = "a"
	k.KEY_RIGHT = "d"
	k.KEY_UP = "w"
	k.KEY_DOWN = "s"
	k.KEY_ACTION = "e"
	k.KEY_ENTER = "return"
	return k
end

function DEFAULTS.list(t)
	local t = t
	for k,v in pairs(t) do
		print(k,v)
	end
end

return DEFAULTS
