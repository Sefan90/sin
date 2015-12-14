local sti = require "sti"
require 'simple-slider'
require 'button'
function love.load()

map = sti.new("bg")

windowWidth = 320
windowHeight = 480
plus = love.graphics.newImage('assets/plus.png')
minus = love.graphics.newImage('assets/minus.png')
trans = love.graphics.newImage('assets/trans.png')

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
	map:update(dt)
	slider:update()
	slider2:update()
	slider2:update()
	slider3:update()
	slider4:update()
	slider5:update()
	slider6:update()
end

function love.draw(dt)
	love.graphics.scale(scalex,scaley)
	backgroundlines()
	love.graphics.setColor(0, 255, 0)
	love.graphics.setLineWidth(2)
	levels(1)
	map:draw()
	sliders()
end

function levels(level)
	if level == 1 then
		for i = 1, 500 do
			--love.graphics.line(360+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*value1)+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*value2)+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*value3),i,360+(math.sin(i*x1)*y1)-(math.sin(i*x1)*value1)+(math.sin(i*x2)*y2)-(math.sin(i*x2)*value2)+(math.sin(i*x3)*y3)-(math.sin(i*x3)*value3),1+i)
			--love.graphics.line(360+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue()),i,360+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue()),1+i)
			love.graphics.line(i,120+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())+(math.sin(i*x5-x5)*y5)-(math.sin(i*x5-x5)*slider5:getValue())+(math.sin(i*x6-x6)*y6)-(math.sin(i*x6-x6)*slider6:getValue())
			,1+i,120+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue())+(math.sin(i*x4)*y4)-(math.sin(i*x4)*slider4:getValue())+(math.sin(i*x5)*y5)-(math.sin(i*x5)*slider5:getValue())+(math.sin(i*x6)*y6)-(math.sin(i*x6)*slider6:getValue()))
		end
	end
end

function sliders()
	love.graphics.setColor(0, 0, 0)
	if drawbutton(trans,"",24,432) == true then
		slider = newSlider(40, 384, 100, slider:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",24,304) == true then
		slider = newSlider(40, 384, 100, slider:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",72,432) == true then
		slider2 = newSlider(88, 384, 100, slider2:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",72,304) == true then
		slider2 = newSlider(88, 384, 100, slider2:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",120,432) == true then
		slider3 = newSlider(136, 384, 100, slider3:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",120,304) == true then
		slider3 = newSlider(136, 384, 100, slider3:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",168,432) == true then
		slider4 = newSlider(184, 384, 100, slider4:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",168,304) == true then
		slider4 = newSlider(184, 384, 100, slider4:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",216,432) == true then
		slider5 = newSlider(232, 384, 100, slider5:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",216,304) == true then
		slider5 = newSlider(232, 384, 100, slider5:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",264,432) == true then
		slider6 = newSlider(280, 384, 100, slider6:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",264,304) == true then
		slider6 = newSlider(280, 384, 100, slider6:getValue()+1, -50, 50, setter, style)
	end
	love.graphics.setColor(0, 255, 0)
	love.graphics.print(math.floor(slider:getValue()),32,274)
	love.graphics.print(math.floor(slider2:getValue()),80,274)
	love.graphics.print(math.floor(slider3:getValue()),128,274)
	love.graphics.print(math.floor(slider4:getValue()),176,274)
	love.graphics.print(math.floor(slider5:getValue()),224,274)
	love.graphics.print(math.floor(slider6:getValue()),272,274)
	love.graphics.setColor(0, 0, 0)
	slider:draw()
	slider2:draw()
	slider3:draw()
	slider4:draw()
	slider5:draw()
	slider6:draw()
end

function backgroundlines()
	love.graphics.setColor(0, 125, 0,125)
	love.graphics.setLineWidth(1)
	love.graphics.line(10,0,10,240)
	love.graphics.line(20,0,20,240)
	love.graphics.line(30,0,30,240)
	love.graphics.line(40,0,40,240)
	love.graphics.line(50,0,50,240)
	love.graphics.line(60,0,60,240)
	love.graphics.line(70,0,70,240)
	love.graphics.line(80,0,80,240)
	love.graphics.line(90,0,90,240)
	love.graphics.line(100,0,100,240)
	love.graphics.line(110,0,110,240)
	love.graphics.line(120,0,120,240)
	love.graphics.line(130,0,130,240)
	love.graphics.line(140,0,140,240)
	love.graphics.line(150,0,150,240)
	love.graphics.line(160,0,160,240)
	love.graphics.line(170,0,170,240)
	love.graphics.line(180,0,180,240)
	love.graphics.line(190,0,190,240)
	love.graphics.line(200,0,200,240)
	love.graphics.line(210,0,210,240)
	love.graphics.line(220,0,220,240)
	love.graphics.line(230,0,230,240)
	love.graphics.line(240,0,240,240)
	love.graphics.line(250,0,250,240)
	love.graphics.line(260,0,260,240)
	love.graphics.line(270,0,270,240)
	love.graphics.line(280,0,280,240)
	love.graphics.line(290,0,290,240)
	love.graphics.line(300,0,300,240)
	love.graphics.line(310,0,310,240)
	
	love.graphics.line(0,10,320,10)
	love.graphics.line(0,20,320,20)
	love.graphics.line(0,30,320,30)
	love.graphics.line(0,40,320,40)
	love.graphics.line(0,50,320,50)
	love.graphics.line(0,60,320,60)
	love.graphics.line(0,70,320,70)
	love.graphics.line(0,80,320,80)
	love.graphics.line(0,90,320,90)
	love.graphics.line(0,100,320,100)
	love.graphics.line(0,110,320,110)
	love.graphics.line(0,120,320,120)
	love.graphics.line(0,130,320,130)
	love.graphics.line(0,140,320,140)
	love.graphics.line(0,150,320,150)
	love.graphics.line(0,160,320,160)
	love.graphics.line(0,170,320,170)
	love.graphics.line(0,180,320,180)
	love.graphics.line(0,190,320,190)
	love.graphics.line(0,200,320,200)
	love.graphics.line(0,210,320,210)
	love.graphics.line(0,220,320,220)
	love.graphics.line(0,230,320,230)
	love.graphics.line(0,240,320,240)
end