local STATECLASS = require("modules/gamestatesClass")

local TITLE = STATECLASS:set("TITLE")
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
local continue = false

function TITLE.preload()
	PRELOADER.newImage(assets.images,"titleBG","assets/images/titleScreen/title_screen_bg.png")
	PRELOADER.newImage(assets.images,"titleText","assets/images/titleScreen/title_screen_text.png")
	PRELOADER.newImage(assets.images,"unfinished","assets/images/etc/unfinished.png")

	ASSETS.preload(function()
		local _bg = ANIM8.newGrid(256,128,assets.images.titleBG:getDimensions()
)
		local bgSpeed = 0.3
		local bgMax = 6

		anim_bg = ANIM8.newAnimation(_bg('1-' .. bgMax,1),bgSpeed,
		function()
			anim_bg:pauseAtEnd()
			GAMESTATES.setState(GAME_INTRO)
		end)
	end)
end

function TITLE.load()
	titleTimer = TIMER.new()
	titleTimer:after(3, function()
		showOptions = true
	end)
end

function TITLE.update(dt)
	titleTimer:update(dt)
	if continue then
		anim_bg:update(dt)
	end
end

function TITLE.draw()
	love.graphics.setColor(255,255,255,255)
	anim_bg:draw(assets.images.titleBG,0,0)
	love.graphics.draw(assets.images.titleText,0,0)

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
				4 + i * padding)
		end
	end
end

function TITLE.keypressed(key)
	if showOptions == false and continue == false then
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
	if cursor == 1 then
		continue = true
		showOptions = false
	else
		if postJam == true then
			GAMESTATES.setState(actions[cursor])
		else
			if cursor == #actions then
				GAMESTATES.setState(actions[cursor])
			else
				GAMESTATES.setState(UNFINISHED)
			end
		end
	end
end

function TITLE.exit()
	ASSETS.setState(false)
end

return TITLE
