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
local function moveTopLeft()
	topLeft.x = topLeft.x + scrollSpeed
	topLeft.y = topLeft.y - scrollSpeed
	-- add the scroll speed to the x-value of the snowPlow
	topLeft.x = topLeft.x + scrollSpeed

	-- make snowPlow bounce off wall once 
	if(topLeft.x < 0) then 
		topLeft.x = topLeft.x + 3 scrollSpeed = -scrollSpeed
	end--Left

	if(topLeft.y < 0) then 
		scrollSpeed = scrollSpeed
	end--Up
end

local function moveTopRight()
    topLeft.x = topLeft.x + scrollSpeed
    topLeft.y = topLeft.y - scrollSpeed
    -- add the scroll speed to the x-value of the snowPlow
    topLeft.x = topLeft.x + scrollSpeed

    -- make snowPlow bounce off wall once 
    if(topLeft.x < 0) then 
        topLeft.x = topLeft.x + 3 scrollSpeed = -scrollSpeed
    end--Left

    if(topLeft.y < 0) then 
        scrollSpeed = scrollSpeed
    end--Up
end

local function moveBottomLeft()
    topRight.x = topRight.x + scrollSpeed
    topRight.y = topRight.y - scrollSpeed
    -- add the scroll speed to the x-value of the snowPlow
    topRight.x = topRight.x + scrollSpeed

    -- make snowPlow bounce off wall once 
    if(topRight.x < 0) then 
        topRight.x = topRight.x + 3 scrollSpeed = -scrollSpeed
    end--Left

    if(topRight.y < 0) then 
        scrollSpeed = scrollSpeed
    end--Up
end

local function moveBottomRight()
    bottomLeft.x = bottomLeft.x + scrollSpeed
    bottomLeft.y = bottomLeft.y - scrollSpeed
    -- add the scroll speed to the x-value of the snowPlow
    bottomLeft.x = bottomLeft.x + scrollSpeed

    -- make snowPlow bounce off wall once 
    if(topLeft.x < 0) then 
        bottomLeft.x = bottomLeft.x + 3 scrollSpeed = -scrollSpeed
    end--Left

    if(bottomLeft.y < 0) then 
        scrollSpeed = scrollSpeed
    end--Up
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
    topLeft = display.newImageRect("Images/TopLeft.png", 200, 200)
    topRight = display.newImageRect("Images/TopRight.png", 200, 200)
    bottomLeft = display.newImageRect("Images/BottomLeft.png", 200, 200)
    bottomRight = display.newImageRect("Images/BottomRight.png", 200, 200)

    -- set the initial x and y position of the beetleship
    topLeft.x = 100
    topLeft.y = display.contentHeight/2

    topRight.x = 100
    topRight.y = display.contentHeight/2

    bottomLeft.x = 100
    bottomLeft.y = display.contentHeight/2

    bottomRight.x = 100
    bottomRight.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topLeft, topRight, bottomLeft, bottomRight )

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

        -- Call the moveBeetleship function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveTopLeft, moveTopRight, moveBottomLeft, moveBottomRight)

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
end