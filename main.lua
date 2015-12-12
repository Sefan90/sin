require 'simple-slider'
function love.load()

windowWidth = 480
windowHeight = 320

if love.system.getOS() == "Android" then
	local x,y = love.window.getDimensions()
	scalex = (x/windowWidth)
	scaley = (y/windowHeight)
else
	scalex = 1
	scaley = scalex
end

love.window.setMode(windowWidth*scalex,windowHeight*scaley) 

d = 100
f = 0.01
slider = newSlider(100, 100, 100, 0, -100, 100, setter, style)
slider2 = newSlider(100, 120, 100, 0, -100, 100, setter, style)
end

function love.update(dt)
	slider:update()
	slider2:update()
	if love.keyboard.isDown('w') then
		d = d +1
	end
	if love.keyboard.isDown('s') then
		d = d -1
	end
	if love.keyboard.isDown('a') then
		f = f +0.01
	end
	if love.keyboard.isDown('d') then
		f = f -0.01
	end
end

function love.draw(dt)
	slider:draw()
	slider2:draw()
	for i = 1, 1500 do
	love.graphics.line(360+(math.sin(i*f-f)*slider:getValue())+(math.sin(i-1)*slider2:getValue()/10), i, 360+(math.sin(i*f)*slider:getValue())+(math.sin(i)*slider2:getValue()/10),1+(i))
	--love.graphics.line(i, 300+(math.sin(i*f-f)*slider:getValue())+(math.sin(i-1)*slider2:getValue()/10), 1+(i), 300+(math.sin(i*f)*slider:getValue())+(math.sin(i)*slider2:getValue()/10))
	--love.graphics.line( 100+(i), 100+(math.sin(i*f-f)*d), 101+(i), 100+(math.sin(i*f)*d))
	--love.graphics.line( 100+(i), 400+(math.cos(i*f-f)*d), 101+(i), 400+(math.cos(i*f)*d))
	--love.graphics.line( 100+(i), 300+(math.cos(i*0.01-0.01)*100)-(math.sin(i*f)*d), 101+(i), 300+(math.sin(i*0.01)*100)-(math.sin(i*f)*d))
	end
end

function love.keypressed(key)
	lastkey = key
end