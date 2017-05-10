local STATECLASS = require("modules/gamestatesClass")

local TITLE = STATECLASS:set("TITLE")

local objects = {}
local timer_flag = false

local options = {
	"Start",
	"Options",
	"About",
	"Credits",
	"Exit"
}
local padding = 12
local font = fonts.jamboree_8
local showOptions = false
local cursor = 1

function TITLE.preload()
	PRELOADER.newImage(assets.images,"titleScreenBG","assets/images/titleScreen/title_screen_bg.png")
	PRELOADER.newImage(assets.images,"titleScreenText","assets/images/titleScreen/title_screen_text.png")

	ASSETS.preload(function()
		local _bg = ANIM8.newGrid(256,128,assets.images.titleScreenBG:getDimensions())
		local _txt = ANIM8.newGrid(256,128,assets.images.titleScreenText:getDimensions())
	
		local max = 11
		local bgSpeed = 0.4
		local txtSpeed = 0.2
		anim_titleBG = ANIM8.newAnimation(_bg('1-' .. max,1),bgSpeed)
		anim_titleText = ANIM8.newAnimation(_txt('1-' .. max,1),txtSpeed)
		table.insert(objects,anim_titleBG)
		table.insert(objects,anim_titleText)
	end)
end

function TITLE.load()
	titleTimer = TIMER.new()
	titleTimer:after(3, function()
		showOptions = true
	end)
	table.insert(objects,titleTimer)
end

function TITLE.update(dt)
	for k,v in pairs(objects) do
		v:update(dt)
	end
end

function TITLE.draw()
	love.graphics.setColor(255,255,255,255)
	anim_titleBG:draw(assets.images.titleScreenBG,0,0)
	anim_titleText:draw(assets.images.titleScreenText,0,0)

	if showOptions == true then
		love.graphics.setColor(255,255,255,255)
		love.graphics.setFont(font)
		for i = 1, #options do
			if i == cursor then
				love.graphics.setColor(255,0,0,255)
			else
				love.graphics.setColor(255,255,255,255)
			end
			love.graphics.print(options[i],
				settings.gameWidth - padding - font:getWidth(options[i]),
				MISC.centerHeight() + i * padding)
		end
	end
end

function TITLE.keypressed(key)
	if showOptions == false then
		showOptions = true
	else
		if key == keybindings.KEY_DOWN then
			cursor = cursor + 1
			if cursor > #options then
				cursor = 1
			end
		elseif key == keybindings.KEY_UP then
			cursor = cursor - 1
			if cursor < 1 then
				cursor = #options
			end
		elseif key == keybindings.KEY_ACTION or 
			key == keybindings.KEY_ENTER then
			TITLE.cursorAction()
		end
	end
end

function TITLE.keyreleased(key)

end

function TITLE.cursorAction()
	local actions = {
		GAME_INTRO,
		OPTIONS,
		ABOUT,
		CREDITS,
		EXIT
	}
	GAMESTATES.setState(actions[cursor])
end

function TITLE.exit()
	ASSETS.setState(false)
end

return TITLE
