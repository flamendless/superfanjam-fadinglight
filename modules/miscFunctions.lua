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

function MISC.draw(x,y)
	love.graphics.setColor(255,0,0,255)
	love.graphics.line(x,y,x+32,y)
end

function MISC.collision(x1,y1,w1,h1,x2,y2,w2,h2)
	return x1 < x2+w2 and x2 < x1+w1 and y1<y2 + h2 and y2 < y1 + h1
end

return MISC
