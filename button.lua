pressedx = 0
pressedy = 0
releasedx = 0
releasedy = 0

--Call drawbutton to use this function
function clickbutton(buttons, x, y)
		if x <= pressedx and x+buttons:getWidth() >= pressedx and y <= pressedy and y+buttons:getHeight() >= pressedy and x <= releasedx and x+buttons:getWidth() >= releasedx and y <= releasedy and y+buttons:getHeight() >= releasedy then
			pressedx = 0
			pressedy = 0
			releasedx = 0
			releasedy = 0
			return true
		end
	return false
end

function drawbutton(buttons,text,x,y)
	love.graphics.draw(buttons, x, y, 0)
	if x <= love.mouse.getX() and x+buttons:getWidth() >= love.mouse.getX() and y <= love.mouse.getY() and y+buttons:getHeight() >= love.mouse.getY() then
		love.graphics.print(text,20, 540)
	end
	if clickbutton(buttons, x, y) then
		return true
	end
	return false
end

function love.mousepressed(x, y, button)
   if button == 1 then --'l'
   		releasedx = 0
		releasedy = 0
		pressedx = x/scalex
		pressedy = y/scaley
   end
end

function love.mousereleased(x, y, button)
   if button == 1 then --'l'
		releasedx = x/scalex
		releasedy = y/scaley
   end
end