-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local companyLogo
local topLeft
local topRight
local bottomLeft
local bottomRight
local scrollXSpeed = 8
local scrollYSpeed = -3

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function TopLeft()
	topLeft.x = topLeft.x + scrollSpeed
	topLeft.y = topLeft.y - scrollSpeed
	-- add the scroll speed to the x-value of the snowPlow
	topLeft.x = topLeft.x + scrollSpeed
	-- change the transparency of the snowPlow every time it moves so that it fades out
	topLeft.alpha = snowPlow.alpha + 0.01

	-- make snowPlow bounce off wall once 
	if(topLeft.x < 0) then 
		topLeft.x = topLeft.x + 3 scrollSpeed = -scrollSpeed
	end--Left

	if(topLeft.y < 0) then 
		scrollSpeed = scrollSpeed
	end--Up
end

local function TopRight()
    snake.x = snake.x + scrollXSpeed
    snake.y = snake.y + scrollYSpeed
end

local function BottomLeft()
    snake.x = snake.x + scrollXSpeed
    snake.y = snake.y + scrollYSpeed
end

local function BottomRight()
    snake.x = snake.x + scrollXSpeed
    snake.y = snake.y + scrollYSpeed
end



-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 204/255, 255/255, 153/255)

    -- Insert the beetleship image
    snake = display.newImageRect("Images/snake.png", 200, 200)

    -- set the initial x and y position of the beetleship
    snake.x = 100
    snake.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( snake )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        rainSoundsChannel = audio.play(rainSounds )

        -- Call the moveBeetleship function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveBeetleship)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(rainSoundsChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------
