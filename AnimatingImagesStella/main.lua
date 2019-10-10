-- AnimatingImages
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the staus bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed1 = 7 
scrollSpeed2 = -1
scrollSpeed3 = -4

local gradientTextObject

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
local function MoveRedCar(event)
	-- add the scroll speed to the x-value of the car
	redCar.x = redCar.x + scrollSpeed1
	-- change the transparency of the car every time it moves so that it fades out
	redCar.alpha = redCar.alpha + 0.05

	if((redCar.x + redCar.width) > display.contentWidth) then 
		redCar.x = redCar.x - 3 scrollSpeed1 = -scrollSpeed1 
	end

	if(redCar.x < 0) then 
		redCar.x = redCar.x + 3 scrollSpeed1 = -scrollSpeed1
	 end
end

-- car will be called over and over agian
Runtime:addEventListener("enterFrame", MoveRedCar) 

---------------------------------------------------------------------------------------
-- Function: MoveCar2
-- Input: this function accepts an event listner 
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the blueCar. 
local function MoveBlueCar(event)
	-- add the scroll speed to the x-value of the car
	blueCar.x = blueCar.x + scrollSpeed2
	-- change the transparency of the blueCar every time it moves so that it fades out
	blueCar.alpha = blueCar.alpha + 0.05
	-- make redCar shrink 
	blueCar.xScale = blueCar.xScale - 0.001
	blueCar.yScale = blueCar.yScale - 0.001
end

-- car will be called over and over agian
Runtime:addEventListener("enterFrame", MoveBlueCar) 

---------------------------------------------------------------------------------------
-- Function: MoveSnowPlow
-- Input: this function accepts an event listner 
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the snowPlow. 
local function MoveSnowPlow(event)
	snowPlow.x = snowPlow.x + scrollSpeed3
	snowPlow.y = snowPlow.y - scrollSpeed3
	-- add the scroll speed to the x-value of the snowPlow
	snowPlow.x = snowPlow.x + scrollSpeed3
	-- change the transparency of the snowPlow every time it moves so that it fades out
	snowPlow.alpha = snowPlow.alpha + 0.07

if(snowPlow.x < 0) then 
		snowPlow.x = snowPlow.x + 3 scrollSpeed3 = -scrollSpeed3 
	end--Left

	if((snowPlow.x + snowPlow.width) > display.contentWidth) then 
		snowPlow.x = snowPlow.x - 3 scrollSpeed3 = -scrollSpeed3

	if(snowPlow.y < 0) then 
		scrollSpeed3 = scrollSpeed3
	end--Up
end

-- car will be called over and over agian
Runtime:addEventListener("enterFrame", MoveSnowPlow) 

---------------------------------------------------------------------------------------
-- LOCAL TEXT object
---------------------------------------------------------------------------------------
local textObject = display.newText (" BE CAREFUL, THE ROAD IS SLIPPERY! ", 520, 100, nil, 50)
local gradientTextObject = { 
	type = "gradient",
	color1 = {153/255, 0, 76/255}, color2 = {255/255, 255/255, 153/255}, direction = "down"
}
textObject:setFillColor(gradientTextObject)
