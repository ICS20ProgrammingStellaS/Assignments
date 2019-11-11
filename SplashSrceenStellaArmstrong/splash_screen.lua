-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- sets the background colour
display.setDefault("background", 255/255, 255/255, 204/255)

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
local scrollSpeed = 6

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function moveTopLeft()
	topLeft.x = topLeft.x + scrollSpeed
	topLeft.y = topLeft.y + scrollSpeed

	-- make snowPlow bounce off wall once 
	if(topLeft.x == 300) then 
		scrollSpeed = 0
		topLeft.isVisible = false
	end--Left

	if(topLeft.y == 300) then 
		scrollSpeed = 0
		topLeft.isVisible = false
	end--Up
end

local function moveTopRight()
    topRight.x = topRight.x - scrollSpeed
    topRight.y = topRight.y + scrollSpeed

    -- make snowPlow bounce off wall once 
	if(topRight.x == 300) then 
		scrollSpeed = 0
		topRight.isVisible = false
	end--Left

	if(topRight.y == 300) then 
		scrollSpeed = 0
		topRight.isVisible = false
	end--Up
end

local function moveBottomLeft()
    bottomLeft.x = bottomLeft.x + scrollSpeed
    bottomLeft.y = bottomLeft.y - scrollSpeed

    -- make snowPlow bounce off wall once 
	if(bottomLeft.x == 300) then 
		scrollSpeed = 0
		bottomLeft.isVisible = false
	end--Left

	if(bottomLeft.y == 300) then 
		scrollSpeed = 0
		bottomLeft.isVisible = false
	end--Up
end

local function moveBottomRight()
    bottomRight.x = bottomRight.x - scrollSpeed
    bottomRight.y = bottomRight.y - scrollSpeed

   	-- make snowPlow bounce off wall once 
	if(bottomRight.x == 300) then 
		scrollSpeed = 0
		bottomRight.isVisible = false
	end--Left

	if(bottomRight.y == 300) then 
		scrollSpeed = 0
		bottomRight.isVisible = false
	end--Up
end

local function animation( event )
	-- make logo rotate
	companyLogo:rotate(5)

	-- make logo fade out
	companyLogo.alpha = companyLogo.alpha - 0.001
	companyLogo.xScale = companyLogo.xScale - 0.004
	companyLogo.yScale = companyLogo.yScale - 0.004
end

local function showCompanyLogo()
	companyLogo.isVisible = true
	bottomRight.isVisible = false
	bottomLeft.isVisible = false
	topRight.isVisible = false
	topRight.isVisible = false
	--timer.performWithDelay(3000, animation)
end

local function timerLogo()
	timer.performWithDelay(675, showCompanyLogo)
	timer.performWithDelay(1000, animation)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    --display.setDefault("background", 204/255, 255/255, 153/255)

    -- Insert the beetleship image
    topLeft = display.newImageRect("Images/TopLeft.png", 200, 200)
    topRight = display.newImageRect("Images/TopRight.png", 200, 200)
    bottomLeft = display.newImageRect("Images/BottomLeft.png", 200, 200)
    bottomRight = display.newImageRect("Images/BottomRight.png", 200, 200)
    companyLogo = display.newImageRect("Images/CompanyLogo.png", 450, 450)
    companyLogo.x = display.contentWidth/2
    companyLogo.y = display.contentHeight/2
    companyLogo.isVisible = false

    -- set the initial x and y position of the beetleship
    topLeft.x = 110
    topLeft.y = 0

    topRight.x = display.contentWidth -110
    topRight.y = 0

    bottomLeft.x = 110
    bottomLeft.y = display.contentHeight

    bottomRight.x = display.contentWidth -110
    bottomRight.y = display.contentHeight
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topLeft )
    sceneGroup:insert( topRight )
    sceneGroup:insert( bottomLeft )
    sceneGroup:insert( bottomRight )

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
        Runtime:addEventListener("enterFrame", moveTopLeft)
		Runtime:addEventListener("enterFrame", moveTopRight)
		Runtime:addEventListener("enterFrame", moveBottomLeft)
		Runtime:addEventListener("enterFrame", moveBottomRight)
		Runtime:addEventListener("enterFrame", timerLogo)
		timerLogo()
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

return scene

