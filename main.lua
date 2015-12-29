local sti = require "sti"
require 'simple-slider'
require 'button'
function love.load()

map = sti.new("bg")
map2 = sti.new("bg2")

level = -1
windowWidth = 320
windowHeight = 480
plus = love.graphics.newImage('assets/plus.png')
minus = love.graphics.newImage('assets/minus.png')
trans = love.graphics.newImage('assets/trans.png')
sl = love.graphics.newImage('assets/slider.png')

if love.system.getOS() == "Android" then
	local x,y = love.graphics.getDimensions()
	scalex = (x/windowWidth)
	scaley = (y/windowHeight)
else
	scalex = 1
	scaley = scalex
end

love.window.setMode(windowWidth*scalex,windowHeight*scaley) 

x1 = love.math.random(2,52)/100
x2 = love.math.random(2,52)/100
x3 = love.math.random(2,52)/100
x4 = love.math.random(2,52)/100
x5 = love.math.random(2,52)/100
x6 = love.math.random(2,52)/100

y1 = love.math.random(-50,50)
y2 = love.math.random(-50,50)
y3 = love.math.random(-50,50)
y4 = love.math.random(-50,50)
y5 = love.math.random(-50,50)
y6 = love.math.random(-50,50)

slider = newSlider(40, 384, 100, 0, -50, 50, setter, style)
slider2 = newSlider(88, 384, 100, 0, -50, 50, setter, style)
slider3 = newSlider(136, 384, 100, 0, -50, 50, setter, style)
slider4 = newSlider(184, 384, 100, 0, -50, 50, setter, style)
slider5 = newSlider(232, 384, 100, 0, -50, 50, setter, style)
slider6 = newSlider(280, 384, 100, 0, -50, 50, setter, style)
end

function love.update(dt)
	if level >= 1 then
		map:update(dt)
		slider:update()
		slider2:update()
		slider2:update()
		slider3:update()
		slider4:update()
		slider5:update()
		slider6:update()
	else
		map2:update(dt)
	end
end

function love.draw(dt)
	levels(level)
	if level >= 1 then
		love.graphics.scale(scalex,scaley)
		backgroundlines()
		map:draw()
		slider = sliders(slider,0)
		slider2 = sliders(slider2,1)
		slider3 = sliders(slider3,2)
		slider4 = sliders(slider4,3)
		slider5 = sliders(slider5,4)
		slider6 = sliders(slider6,5)
		
	else
		map2:draw()
	end
end

function levels(level)
	love.graphics.setColor(0, 255, 0)
	love.graphics.setLineWidth(2)
	if level == -1 then
		--startscreen
		love.graphics.print('Start', 100,100)
		if drawbutton(plus,"",24,100) == true then
			changelevel(0)
		end
	elseif level == 0 then 
		--SelectLevel
		for i = 0, 6 do
			if drawbutton(plus,i+1,(48*i+24)%windowWidth,48*math.floor(i/6)+200) == true then
				changelevel(i+1)
			end
		end
	elseif level == 1 then
		lc = true
		for i = 0, windowWidth do
			love.graphics.line(i,130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())
			,1+i,130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue()))	
			if (130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())) >= 130.000000001  then
				lc = false
			end
		end
		if lc == true then changelevel(0) end
	elseif level == 2 then
		lc = true
		for i = 0, windowWidth do
			love.graphics.line(i,130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())
			,1+i,130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue()))
			if (130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())) >= 130.000000001 then
				lc = false
			end
		end
		if lc == true then changelevel(0) end
	elseif level == 3 then
		lc = true
		for i = 0, windowWidth do
			love.graphics.line(i,130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())
			,1+i,130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue()))
			if (130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())) >= 130.000000001 then
				lc = false
			end
		end
		if lc == true then changelevel(0) end
	elseif level == 4 then
		lc = true
		for i = 0, windowWidth do
			love.graphics.line(i,130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())
			,1+i,130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue())+(math.sin(i*x4)*y4)-(math.sin(i*x4)*slider4:getValue()))
			if (130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())) >= 130.000000001 then
				lc = false
			end
		end
		if lc == true then changelevel(0) end
	elseif level == 5 then
		lc = true
		for i = 0, windowWidth do
			love.graphics.line(i,130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())+(math.sin(i*x5-x5)*y5)-(math.sin(i*x5-x5)*slider5:getValue())
			,1+i,130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue())+(math.sin(i*x4)*y4)-(math.sin(i*x4)*slider4:getValue())+(math.sin(i*x5)*y5)-(math.sin(i*x5)*slider5:getValue()))
			if (130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())+(math.sin(i*x5-x5)*y5)-(math.sin(i*x5-x5)*slider5:getValue())) >= 130.000000001 then
				lc = false
			end
		end
		if lc == true then changelevel(0) end
	elseif level == 6 then
		lc = true
		for i = 0, windowWidth do
			love.graphics.line(i,130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())+(math.sin(i*x5-x5)*y5)-(math.sin(i*x5-x5)*slider5:getValue())+(math.sin(i*x6-x6)*y6)-(math.sin(i*x6-x6)*slider6:getValue())
			,1+i,130+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue())+(math.sin(i*x4)*y4)-(math.sin(i*x4)*slider4:getValue())+(math.sin(i*x5)*y5)-(math.sin(i*x5)*slider5:getValue())+(math.sin(i*x6)*y6)-(math.sin(i*x6)*slider6:getValue()))
			if (130+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())+(math.sin(i*x5-x5)*y5)-(math.sin(i*x5-x5)*slider5:getValue())+(math.sin(i*x6-x6)*y6)-(math.sin(i*x6-x6)*slider6:getValue())) >= 130.000000001 then
				lc = false
			end
		end
		if lc == true then changelevel(0) end
	end
end

function sliders(tempslider, i)
	if level >= i+1 then
		if drawbutton(minus,"",48*i+24,440) == true then
			tempslider = newSlider(48*i+40, 384, 100, tempslider:getValue()-1, -50, 50, setter, style)
		end
		if drawbutton(plus,"",48*i+24,304) == true then
			tempslider = newSlider(48*i+40, 384, 100, tempslider:getValue()+1, -50, 50, setter, style)
		end
		love.graphics.setColor(0, 255, 0)
		love.graphics.print(math.floor(tempslider:getValue()),48*i+32,274)
		love.graphics.setColor(255, 255, 255)
		tempslider:draw()
	end
	return tempslider
end

function backgroundlines()
	love.graphics.setColor(0, 125, 0,125)
	love.graphics.setLineWidth(1)
	for i = 1, 31 do
		love.graphics.line(i*10,0,i*10,240)
		love.graphics.line(0,i*10,320,i*10)
	end
end

function changelevel(input)
	updateRandom()
	sliderReset()
	level = input
end

function updateRandom()
	x1 = love.math.random(2,52)/100
	x2 = love.math.random(2,52)/100
	x3 = love.math.random(2,52)/100
	x4 = love.math.random(2,52)/100
	x5 = love.math.random(2,52)/100
	x6 = love.math.random(2,52)/100

	y1 = love.math.random(-50,50)
	y2 = love.math.random(-50,50)
	y3 = love.math.random(-50,50)
	y4 = love.math.random(-50,50)
	y5 = love.math.random(-50,50)
	y6 = love.math.random(-50,50)
end

function sliderReset()
	slider = newSlider(40, 384, 100, 0, -50, 50, setter, style)
	slider2 = newSlider(88, 384, 100, 0, -50, 50, setter, style)
	slider3 = newSlider(136, 384, 100, 0, -50, 50, setter, style)
	slider4 = newSlider(184, 384, 100, 0, -50, 50, setter, style)
	slider5 = newSlider(232, 384, 100, 0, -50, 50, setter, style)
	slider6 = newSlider(280, 384, 100, 0, -50, 50, setter, style)
end
