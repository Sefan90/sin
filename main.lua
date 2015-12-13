local sti = require "sti"
require 'simple-slider'
require 'button'
function love.load()

map = sti.new("bg")

windowWidth = 480
windowHeight = 320
plus = love.graphics.newImage('assets/plus.png')
minus = love.graphics.newImage('assets/minus.png')
trans = love.graphics.newImage('assets/trans.png')

if love.system.getOS() == "Android" then
	local x,y = love.window.getDimensions()
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

slider = newSlider(100, 40, 100, 0, -50, 50, setter, style)
slider2 = newSlider(100, 88, 100, 0, -50, 50, setter, style)
slider3 = newSlider(100, 136, 100, 0, -50, 50, setter, style)
slider4 = newSlider(100, 184, 100, 0, -50, 50, setter, style)
slider5 = newSlider(100, 232, 100, 0, -50, 50, setter, style)
slider6 = newSlider(100, 280, 100, 0, -50, 50, setter, style)
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
	backgroundlines()
	love.graphics.setColor(0, 255, 0)
	love.graphics.setLineWidth(2)
	levels(1)
	map:draw()
	sliders()
end

function love.keypressed(key)
	lastkey = key
end

function levels(level)
	if level == 1 then
		for i = 1, 1500 do
			--love.graphics.line(360+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*value1)+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*value2)+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*value3),i,360+(math.sin(i*x1)*y1)-(math.sin(i*x1)*value1)+(math.sin(i*x2)*y2)-(math.sin(i*x2)*value2)+(math.sin(i*x3)*y3)-(math.sin(i*x3)*value3),1+i)
			--love.graphics.line(360+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue()),i,360+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue()),1+i)
			love.graphics.line(360+(math.sin(i*x1-x1)*y1)-(math.sin(i*x1-x1)*slider:getValue())+(math.sin(i*x2-x2)*y2)-(math.sin(i*x2-x2)*slider2:getValue())+(math.sin(i*x3-x3)*y3)-(math.sin(i*x3-x3)*slider3:getValue())+(math.sin(i*x4-x4)*y4)-(math.sin(i*x4-x4)*slider4:getValue())+(math.sin(i*x5-x5)*y5)-(math.sin(i*x5-x5)*slider5:getValue())+(math.sin(i*x6-x6)*y6)-(math.sin(i*x6-x6)*slider6:getValue())
			,i,360+(math.sin(i*x1)*y1)-(math.sin(i*x1)*slider:getValue())+(math.sin(i*x2)*y2)-(math.sin(i*x2)*slider2:getValue())+(math.sin(i*x3)*y3)-(math.sin(i*x3)*slider3:getValue())+(math.sin(i*x4)*y4)-(math.sin(i*x4)*slider4:getValue())+(math.sin(i*x5)*y5)-(math.sin(i*x5)*slider5:getValue())+(math.sin(i*x6)*y6)-(math.sin(i*x6)*slider6:getValue()),1+i)
		end
	end
end

function sliders()
	love.graphics.setColor(0, 0, 0)
	if drawbutton(trans,"",16,24) == true then
		slider = newSlider(100, 40, 100, slider:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",150,24) == true then
		slider = newSlider(100, 40, 100, slider:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",16,72) == true then
		slider2 = newSlider(100, 88, 100, slider2:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",150,72) == true then
		slider2 = newSlider(100, 88, 100, slider2:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",16,120) == true then
		slider3 = newSlider(100, 136, 100, slider3:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",150,120) == true then
		slider3 = newSlider(100, 136, 100, slider3:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",16,168) == true then
		slider4 = newSlider(100, 184, 100, slider4:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",150,168) == true then
		slider4 = newSlider(100, 184, 100, slider4:getValue()+1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",16,216) == true then
		slider5 = newSlider(100, 232, 100, slider5:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",150,216) == true then
		slider5 = newSlider(100, 232, 100, slider5:getValue()+1, -50, 50, setter, style)
	end
		if drawbutton(trans,"",16,264) == true then
		slider6 = newSlider(100, 280, 100, slider6:getValue()-1, -50, 50, setter, style)
	end
	if drawbutton(trans,"",150,264) == true then
		slider6 = newSlider(100, 280, 100, slider6:getValue()+1, -50, 50, setter, style)
	end
	love.graphics.print(math.floor(slider:getValue()),200,32,math.pi/2)
	love.graphics.print(math.floor(slider2:getValue()),200,80,math.pi/2)
	love.graphics.print(math.floor(slider3:getValue()),200,128,math.pi/2)
	love.graphics.print(math.floor(slider4:getValue()),200,176,math.pi/2)
	love.graphics.print(math.floor(slider5:getValue()),200,224,math.pi/2)
	love.graphics.print(math.floor(slider6:getValue()),200,272,math.pi/2)
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
	love.graphics.line(240,0,240,320)
	love.graphics.line(250,0,250,320)
	love.graphics.line(260,0,260,320)
	love.graphics.line(270,0,270,320)
	love.graphics.line(280,0,280,320)
	love.graphics.line(290,0,290,320)
	love.graphics.line(300,0,300,320)
	love.graphics.line(310,0,310,320)
	love.graphics.line(320,0,320,320)
	love.graphics.line(330,0,330,320)
	love.graphics.line(340,0,340,320)
	love.graphics.line(350,0,350,320)
	love.graphics.line(360,0,360,320)
	love.graphics.line(370,0,370,320)
	love.graphics.line(380,0,380,320)
	love.graphics.line(390,0,390,320)
	love.graphics.line(400,0,400,320)
	love.graphics.line(410,0,410,320)
	love.graphics.line(420,0,420,320)
	love.graphics.line(430,0,430,320)
	love.graphics.line(440,0,440,320)
	love.graphics.line(450,0,450,320)
	love.graphics.line(460,0,460,320)
	love.graphics.line(470,0,470,320)
	
	love.graphics.line(240,10,480,10)
	love.graphics.line(240,20,480,20)
	love.graphics.line(240,30,480,30)
	love.graphics.line(240,40,480,40)
	love.graphics.line(240,50,480,50)
	love.graphics.line(240,60,480,60)
	love.graphics.line(240,70,480,70)
	love.graphics.line(240,80,480,80)
	love.graphics.line(240,90,480,90)
	love.graphics.line(240,100,480,100)
	love.graphics.line(240,110,480,110)
	love.graphics.line(240,120,480,120)
	love.graphics.line(240,130,480,130)
	love.graphics.line(240,140,480,140)
	love.graphics.line(240,150,480,150)
	love.graphics.line(240,160,480,160)
	love.graphics.line(240,170,480,170)
	love.graphics.line(240,180,480,180)
	love.graphics.line(240,190,480,190)
	love.graphics.line(240,200,480,200)
	love.graphics.line(240,210,480,210)
	love.graphics.line(240,220,480,220)
	love.graphics.line(240,230,480,230)
	love.graphics.line(240,240,480,240)
	love.graphics.line(240,250,480,250)
	love.graphics.line(240,260,480,260)
	love.graphics.line(240,270,480,270)
	love.graphics.line(240,280,480,280)
	love.graphics.line(240,290,480,290)
	love.graphics.line(240,300,480,300)
	love.graphics.line(240,310,480,310)
end