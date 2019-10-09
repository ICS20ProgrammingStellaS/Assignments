-- AnimatingImages
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the staus bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed1 = 7 
scrollSpeed2 = -2
scrollSpeed3 = 4


local blueCar
local redCar
local snowPlow

-- background image with width and height 
local backgroundImage = display.newImageRect("Images/background.PNG", 2248, 1736)

-- characters images with width and height 
local blueCar = display.newImageRect("Images/blueCar.png", 250, 150)
local redCar = display.newImageRect("Images/redCar.png", 250, 150)
local snowPlow = display.newImageRect("Images/snowPlow.png", 350, 250)

-- set the images to be transparent
blueCar.alpha = 1
redCar.alpha = 1
snowPlow.alpha = 1

-- set the initials x and y position of each image
blueCar.x = 750
blueCar.y = 475

redCar.x = 200
redCar.y = 600

snowPlow.x = 600
snowPlow.y = 275

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES 
----------------------------------------------------------------------------------------

-- Function: MoveCar1
-- Input: this function accepts an event listner 
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the car. 
local function MoveCar1(event)
	-- add the scroll speed to the x-value of the car
	redCar.x = redCar.x + scrollSpeed1
	-- change the transparency of the car every time it moves so that it fades out
	redCar.alpha = redCar.alpha + 0.05
end

-- car will be called over and over agian
Runtime:addEventListener("enterFrame", MoveCar1) 

---------------------------------------------------------------------------------------
-- Function: MoveCar2
-- Input: this function accepts an event listner 
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the car. 
local function MoveCar2(event)
	-- add the scroll speed to the x-value of the car
	blueCar.x = blueCar.x + scrollSpeed2
	-- change the transparency of the car every time it moves so that it fades out
	blueCar.alpha = blueCar.alpha + 0.05
	-- make redCar shrink 
	blueCar.xScale = blueCar.xScale - 0.0001
	blueCar.yScale = blueCar.yScale - 0.001
end

-- car will be called over and over agian
Runtime:addEventListener("enterFrame", MoveCar2) 
