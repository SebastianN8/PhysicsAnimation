-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: May 10
--
-- this program combines previous units such as physics, collisions and spritesheets
-----------------------------------------------------------------------------------------

-- Hidding status bar
display.setStatusBar(display.HiddenStatusBar)

-- Variable for bullets
local theBullets = {}

-- Introducion physics
local physics = require('physics')
physics.start()
physics.setGravity(0, 25)
--physics.setDrawMode('hybrid')

-- Location Variables
--centerX = display.contentWidth * 0.5
--centerY = display.contentHeight * 0.5

-- left barrier
local leftBarrier = display.newRect(0, display.contentHeight / 2, 1, display.contentHeight)
leftBarrier.id = 'the left barrier'
physics.addBody(leftBarrier, 'static', {
	friction = 0.5,
	bounce = 0.3
	})

-- Land image
local myLand = display.newImageRect('./Assets/Sprites/land.png', 2048, 400)
myLand.x = display.contentWidth * 0.5
myLand.y = display.contentHeight
myLand.id = 'The land'
physics.addBody(myLand, 'static', {
	friction = 0.5,
	bounce = 0.3
	})

-- Introduction of the characters
-- Zone for all the sprites related to the ninja
-- Option Sheets
-- Idle
local sheetOptionsIdleNinja = {
	width = 232,
	height = 439,
	numFrames = 10
}

-- Run
local sheetOptionsRunNinja = {
	width = 363,
	height = 458,
	numFrames = 10
}

-- Jump
local sheetOptionsJumpNinja = {
	width = 362,
	height = 483,
	numFrames = 10
}

-- Throw
local sheetOptionsThrowNinja = {
	width = 377,
	height = 451,
	numFrames = 10
}

-- Loading the SpriteSheets to memory
-- Idle
local sheetIdleNinja = graphics.newImageSheet('./Assets/SpriteSheets/Ninja/ninjaBoyIdle.png', sheetOptionsIdleNinja)

-- Run
local sheetRunNinja = graphics.newImageSheet('./Assets/SpriteSheets/Ninja/ninjaBoyRun.png', sheetOptionsRunNinja)

-- Jump
local sheetJumpNinja = graphics.newImageSheet('./Assets/SpriteSheets/Ninja/ninjaBoyJump.png', sheetOptionsJumpNinja)

-- Throw
local sheetThrowNinja = graphics.newImageSheet('./Assets/SpriteSheets/Ninja/ninjaBoyThrow.png', sheetOptionsThrowNinja)

-- The sequence data table for the ninja
local sequence_data_ninja = {
{
	name = 'idle',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 1,
	sheet = sheetIdleNinja
},
{
	name = 'run',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 1,
	sheet = sheetRunNinja
},
{
	name = 'jump',
	start = 1,
	count = 10,
	time = 2000,
	loopCount = 1,
	sheet = sheetJumpNinja
},
{
	name = 'throw',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 1,
	sheet = sheetThrowNinja
}
}

-- Putting the Ninja on the screen
local ninja = display.newSprite(sheetIdleNinja, sequence_data_ninja)
ninja.x = display.contentCenterX / 5
ninja.y = display.contentHeight - 417
physics.addBody(ninja, 'dynamic', {
	friction = 0.5,
	bounce = 0.3
	})
ninja.isFixedRotation = true
ninja:setSequence('idle')
ninja:play()

-- Zone for all the sprites related to the robot
-- Option Sheets
-- Idle
local sheetOptionsIdleRobot = {
	width = 567,
	height = 556,
	numFrames = 10
}

-- Death
local sheetOptionsDeadRobot = {
	width = 562,
	height = 519,
	numFrames = 10
}

-- Loading the SpriteSheets to memory
-- Idle
local sheetIdleRobot = graphics.newImageSheet('./Assets/SpriteSheets/Robot/robotIdle.png', sheetOptionsIdleRobot)

-- Dead
local sheetDeadRobot = graphics.newImageSheet('./Assets/SpriteSheets/Robot/robotDead.png', sheetOptionsDeadRobot)

-- Sequence data table for Robot
local sequence_data_robot = {
{
	name = 'idle',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 0,
	sheet = sheetIdleRobot
},
{
	name = 'dead',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 1,
	sheet = sheetDeadRobot
}
}

-- Putting the robot on screen
local robot = display.newSprite(sheetIdleRobot, sequence_data_robot)
robot.x = display.contentCenterX * 1.5
robot.y = display.contentHeight - 430
robot:setSequence('idle')
robot:play()
robot.id = 'robot'
physics.addBody(robot, 'dynamic', {
	friction = 0.5,
	})
robot.isFixedRotation = true

-- Buttons
-- D-pad
local thedPad = display.newImage('./Assets/Sprites/d-pad.png')
thedPad.x = 160
thedPad.y = display.contentHeight - 160
thedPad.id = 'The d-pad'
thedPad.alpha = 0.5

-- Up arrow
--local upArrow = display.newImage('./Assets/Sprites/upArrow.png')
--upArrow.x = 160
--upArrow.y = display.contentHeight - 268.7
--upArrow.id = 'Up arrow'

-- Down arrow
--local downArrow = display.newImage('./Assets/Sprites/downArrow.png')
--downArrow.x = 160
--downArrow.y = display.contentHeight - 52.3
--downArrow.id = 'Down arrow'

-- Left arrow
--local leftArrow = display.newImage('./Assets/Sprites/leftArrow.png')
--leftArrow.x = 52
--leftArrow.y = display.contentHeight - 160
--leftArrow.id = 'Left arrow'

-- Right arrow
local rightArrow = display.newImage('./Assets/Sprites/rightArrow.png')
rightArrow.x = 268.7
rightArrow.y = display.contentHeight - 160
rightArrow.id = 'Right arrow'

-- Jump button
local jumpButton = display.newImage('./Assets/Sprites/jumpButton.png')
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 80
jumpButton.id = 'Jump button'
jumpButton.alpha = 1

-- Shoot button
local shootButton = display.newImage('./Assets/Sprites/jumpButton.png')
shootButton.x = display.contentWidth - 230
shootButton.y = display.contentHeight - 80
shootButton.id = 'Shoot button'

-- Function for movement to the right
function rightArrow:touch(event)
	if (event.phase == 'ended') then
		transition.moveBy(ninja, {
			x = 150,
			y = 0,
			time = 1000
			})
		ninja:setSequence('run')
		ninja:play()
		timer.performWithDelay(1000, resetToIdle)
	end
end

-- Function to shoot
function shootButton:touch(event)
	if (event.phase == 'began') then
		ninja:setSequence('throw')
		ninja:play()
		timer.performWithDelay(1000, resetToIdle)
		-- Introduce a single bullet
		local singleBullet = display.newImage('./Assets/Sprites/Kunai.png')
		singleBullet.x = ninja.x + 200
		singleBullet.y = ninja.y
		singleBullet.id = 'a bullet'
		physics.addBody(singleBullet, 'dynamic', {
			friction = 0.5
			})
		singleBullet.isFixedRotation = true
		-- Make the object a bullet
		singleBullet.isBullet = true
		singleBullet.gravityScale = 0
		singleBullet:setLinearVelocity(1500, 0)
		-- Introduce the object to the table
		table.insert(theBullets, singleBullet)
	end
end

-- Function to remove the bullets
local function checkBulletsUsed(event)
	local bulletCounter
	-- If statement
	if #theBullets > 0 then
		for bulletCounter = #theBullets, 1, -1 do
			if (theBullets[bulletCounter].x > display.contentWidth + 1000) then
				theBullets[bulletCounter]:removeSelf()
				theBullets[bulletCounter] = nil
				print('removed')
				table.remove(theBullets, bulletCounter)
			end
		end
	end
end

-- Multi collision function
local function onCollision(event)
	if (event.phase == 'began') then
		-- Variables for object order
		local obj1 = event.object1
		local obj2 = event.object2
		local explosionLocationX = obj1.x
		local explosionLocationY = obj2.y

		if (obj1.id == 'a bullet' and obj2.id == 'robot') or 
			(obj1.id == 'robot' and obj2.id == 'a bullet') then
			-- For loop to erase bullets
			local bulletCounter
			for bulletCounter = #theBullets, 1, -1 do
				if (theBullets[bulletCounter] == obj1 or theBullets[bulletCounter] == obj2) then
					theBullets[bulletCounter]:removeSelf()
					theBullets[bulletCounter] = nil
					table.remove(theBullets, bulletCounter)
					break
				end
			end

			-- Remove robot after collision
			robot:setSequence('dead')
			robot:play()

			-- Sound effect
			local explosionSound = audio.loadStream('./Assets/Sounds/explosion.wav')
			local explosionChannel = audio.play(explosionSound)

			-- Code that deals with the explosions 
			-- variable that contains the parameters for the function
			local emitterParams = {

			    startColorAlpha = 1,

			    startParticleSizeVariance = 250,

			    startColorGreen = 0.3031555,

			    yCoordFlipped = -1,

			    blendFuncSource = 769,

			    rotatePerSecondVariance = 153.95,

			    particleLifespan = 0.7237,

			    tangentialAcceleration = -1440.74,

			    finishColorBlue = 0.34567,

			    finishColorGreen = 0.5443883,

			    blendFuncDestination = 1,

			    startParticleSize = 400.95,

			    startColorRed = 1,

			    textureFileName = "./assets/sprites/fire.png",

			    startColorVarianceAlpha = 1,

			    maxParticles = 100,

			    finishParticleSize = 540,

			    duration = 0.25,

			    finishColorRed = 1,

			    maxRadiusVariance = 72.63,

			    finishParticleSizeVariance = 250,

			    gravityx = 0,

			    speedVariance = 90.79,

			    tangentialAccelVariance = -420.11,

			    angleVariance = -142.62,

			    angle = -244.11
			}

			-- Function that generates explosion (particle emitter)
			local emitter = display.newEmitter(emitterParams)
			emitter.x = explosionLocationX
			emitter.y = explosionLocationY
		end
	end
end



-- Function to jump
function jumpButton:touch(event)
	if (event.phase == 'ended') then
	    ninja:setLinearVelocity( 0, -750 )
	    ninja:setSequence('jump')
	    ninja:play()
	    timer.performWithDelay(2000, resetToIdle)
	end
end

-- Resenting Sprite Sheet
local function resetToIdle(event)
	if (event.phase == 'ended') then
		ninja:setSequence('idle')
		ninja:play()
	end
end

-- Event Listeners 
rightArrow:addEventListener('touch', rightArrow)
jumpButton:addEventListener('touch', jumpButton)
ninja:addEventListener('sprite', resetToIdle)
shootButton:addEventListener('touch', shootButton)
Runtime:addEventListener('enterFrame', checkBulletsUsed)
Runtime:addEventListener('collision', onCollision)