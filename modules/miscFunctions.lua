local MISC = {}

function MISC.centerWidth()
	return settings.gameWidth/2
end

function MISC.centerHeight()
	return settings.gameHeight/2
end

function MISC.offsetWidth(animation,frames,img)
	if animation == true then
		return (img:getWidth()/frames)/2
	else
		return img:getWidth()/2
	end
end

function MISC.offsetHeight(animaton,frames,img)
	if animaton == true then
		return (img:getHeight()/frames)/2
	else
		return img:getHeight()/2
	end
end

function MISC.oppositeAlpha(a,starting)
	return starting + (255 - a)
end

function MISC.iterate(tbl)
	local tbl = tbl or {}
	for k,v in pairs(tbl) do
		print(k,v)
	end
end

function MISC.print(str)
	love.graphics.setColor(255,255,255,255)
	love.graphics.print(str,16,16)
end

return MISC
