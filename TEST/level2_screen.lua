-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

	
    print(lives)
    
return scene




    local redCar

    local scrollSpeed1 = 2

    local redCar = display.newImageRect("Images/AppLogo.png", 250, 150)

    redCar.alpha = 1

    redCar.x = 700
    redCar.y = 300

    --local reverse = 1

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

    if(redCar.x < 900) then 
        redCar.x = redCar.x + 3 scrollSpeed1 = -scrollSpeed1
     end
end
 
-- Redcar will be called over and over agian
Runtime:addEventListener("enterFrame", MoveRedCar) 

-----------------------------------------------