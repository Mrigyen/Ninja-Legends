--Ninja Legends
--Created By Mrigyen Sawant

_W = display.viewableContentWidth
_H = display.viewableContentHeight


--storyboard = require ( "storyboard");



--storyboard.gotoScene("title", {
--	effect = "flip", 
--	time = 200
--	});

display.setStatusBar(display.HiddenStatusBar)

--system.setAccelerometerInterval( 30 )

local physics = require("physics")
physics.start ()
physics.setDrawMode("hybrid")




local ninjainair
local tapping = false
local loopsidechange = 0
local collisioncheck




local sheetInfo = require("ninja")
local ninjaSheet = graphics.newImageSheet( "ninja.png", sheetInfo:getSheet() )

local background = display.newRect (0,0, _W, _H)

local ground = display.newRect (0, (_H - 80), _W, (_W - 80))
ground:setFillColor (255,0,0)

local leftwall = display.newRect (0, 0, 80, _H)
leftwall:setFillColor (255,0,0)

local rightwall  = display.newRect ((_W - 80), 0 , 80, _H)
rightwall:setFillColor (255,0,0)

local floor1  = display.newRect (0, (_H - 500) , (_W - 300), 80)
rightwall:setFillColor (255,0,0)

local floor2  = display.newRect ((_W - 300), 500 , _W, 80)
rightwall:setFillColor (255,34,0)

local ninja = display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja"))
ninja.x = 200
ninja.y = 400





physics.addBody(ground, "static",{friction = 0.5, bounce = 0})
physics.addBody(leftwall, "static",{friction = 0.5, bounce = 0})
physics.addBody(rightwall, "static",{friction = 0.5, bounce = 0})
physics.addBody(floor1, "static",{friction = 0.5, bounce = 0})
physics.addBody(floor2, "static",{friction = 0.5, bounce = 0})
physics.addBody(ninja, {friction = 0.5, bounce = 0})





--[[function sidechange()
	local playerx = ninja.x
	if(playerx < ninja.x) then
		ninja = display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja right"))
	end
		if(ninja.x < playerx) then
		ninja = display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja left"))
	end
end--]]

if (loopsidechange == 0) then
	if (ninjainair == true) then
		sidechange()
	end
end









function accelerometer(q)
		print ("moving")
	if (collisioncheck==false) then
			if(ninja.rotation > 0 or ninja.rotation < 0) then
				ninja.rotation = 0
			end
	end
	--ninja.x = q.xInstant

	
	ninja.x = ninja.x + (ninja.x * q.xGravity)
	
	--[[ninja.x = display.contentCenterX + (display.contentCenterX * (q.xGravity*3))
	if (q.xInstant > ninja.x) then
			ninja.x =  ninja.x + ((q.xInstant - ninja.x) /5)--(ninja.x + q.xInstant) * 3

	elseif (q.xInstant < ninja.x) then
		ninja.x =  ninja.x - (ninja.x - q.xInstant)
	end--]]
end

function ninja:collision(q)
	if(ninja.rotation > 0 or ninja.rotation < 0) then
		ninja.rotation = 0
	end
	print ("collision")
	
	if (q.phase == "began") then
		local hitsnd = audio.loadSound("hit.wav")
		audio.play(hitsnd)
		collisioncheck = true
		if (ninja == display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja left"))) then
			ninja = display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja"))
		elseif (ninja == display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja right"))) then
			ninja = display.newImage (ninjaSheet, sheetInfo:getFrameIndex("ninja"))
		end
		print ("collision began")
		ninjainair = false
		--MENTAL NOTE: create artificial bounce if doesn't really bounce properly
			
	elseif (q.phase=="ended") then
		collisioncheck=false
		ninjainair = true
		ground.bounce = 0.5
		--sidechange()
	end
end

function tap (q)
	
	if (ninjainair == false) then
		ninja:setLinearVelocity( 0, -500 )
		--ninja:applyLinearImpulse( math.random(-100,100), 40, ninja.x, ninja.y )
		
	end
	print ("tap")
end

Runtime:addEventListener("tap", tap)

ninja:addEventListener( "collision", ninja )

Runtime:addEventListener("accelerometer", accelerometer)

