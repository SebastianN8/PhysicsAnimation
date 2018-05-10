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

-- Introducion physics
local physics = require('physics')
physics.start()
physics.setGravity(0, 25)
-- physics.setDrawMode('hybrid')

-- Location Variables
--centerX = display.contentWidth * 0.5
--centerY = display.contentHeight * 0.5

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
	name = 'Idle',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 0,
	sheet = sheetIdleNinja
},
{
	name = 'Run',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 0,
	sheet = sheetRunNinja
},
{
	name = 'Jump',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 0,
	sheet = sheetJumpNinja
},
{
	name = 'Throw',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 0,
	sheet = sheetThrowNinja
}
}

-- Putting the Ninja on the screen
local ninja = display.newSprite(sheetIdleNinja, sequence_data_ninja)
ninja.x = display.contentCenterX / 5
ninja.y = display.contentHeight - 417
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
	name = 'Dead',
	start = 1,
	count = 10,
	time = 1000,
	loopCount = 0,
	sheet = sheetDeadRobot
}
}

-- Putting the robot on screen
local robot = display.newSprite(sheetIdleRobot, sequence_data_robot)
robot.x = display.contentCenterX * 1.5
robot.y = display.contentHeight - 430
robot:setSequence('idle')
robot:play()

-- Buttons
-- D-pad
local thedPad = display.newImage('./Assets/Sprites/d-pad.png')
thedPad.x = 160
thedPad.y = display.contentHeight - 160
thedPad.id = 'The d-pad'
thedPad.alpha = 0.5

-- Up arrow
local upArrow = display.newImage('./Assets/Sprites/upArrow.png')
upArrow.x = 160
upArrow.y = display.contentHeight - 268.7
upArrow.id = 'Up arrow'

-- Down arrow
local downArrow = display.newImage('./Assets/Sprites/downArrow.png')
downArrow.x = 160
downArrow.y = display.contentHeight - 52.3
downArrow.id = 'Down arrow'

-- Left arrow
local leftArrow = display.newImage('./Assets/Sprites/leftArrow.png')
leftArrow.x = 52
leftArrow.y = display.contentHeight - 160
leftArrow.id = 'Left arrow'

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

local shootButton = display.newImage('./Assets/Sprites/jumpButton.png')
shootButton.x = display.contentWidth - 230
shootButton.y = display.contentHeight - 80
shootButton.id = 'Shoot button'



