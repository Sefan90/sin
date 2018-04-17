--Set to X and Y coordinates outside of the game
pressedx = -100
pressedy = -100
releasedx = -100
releasedy = -100

--Call drawbutton to use this function
function clickbutton(buttons, x, y)
		if x <= pressedx and x+buttons:getWidth() >= pressedx and y <= pressedy and y+buttons:getHeight() >= pressedy and x <= releasedx and x+buttons:getWidth() >= releasedx and y <= releasedy and y+buttons:getHeight() >= releasedy then
			pressedx = -100
			pressedy = -100
			releasedx = -100
			releasedy = -100
			return true
		end
	return false
end

function drawbutton(buttons,text,x,y)
	love.graphics.draw(buttons, x, y, 0)
	love.graphics.setColor(0, 0, 0)
	if y == 0 then
		love.graphics.print(text,x, y+1)
	else
		love.graphics.print(text,x, y+6)
	end
	love.graphics.setColor(255, 255, 255)
	if x <= love.mouse.getX() and x+buttons:getWidth() >= love.mouse.getX() and y <= love.mouse.getY() and y+buttons:getHeight() >= love.mouse.getY() then
		-- levels(levelpreview)
		-- love.graphics.setColor(255, 255, 255)
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