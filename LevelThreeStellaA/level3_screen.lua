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
sceneName = "level3_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

    -- The local variables for this scene
    local bkg_image

    local question1
    local question2

    -- lives 
    local lives = 3
    
    local aidKit1
    local aidKit2
    local aidKit3

    local points = 0
    local correct
    local incorrect

    -----------------------------------------------------------------------------------------

    -- sound
   --[[ local correctSound = audio.loadSound("Sounds/CorrectSound.wav")
    local correctSoundChannel
    local wrongSound = audio.loadSound("Sounds/IncorrectSound.mp3")
    local wrongSoundChannel

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function HideImages()
    question1.isVisible = false
    question2.isVisible = false
end 

local function ShowDrops()
    aidKit1.isVisible = true
    aidKit2.isVisible = true
    aidKit3.isVisible = true
end

local function TouchListenerAnswer(event)
    -- get the object name that was clicked
    local object = event.target

    -- get the user answer from the text object that was clicked on    

    if (event.phase == "ended") then

        print("correct")
        correct.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        --print (points)
        points = points + 1

        correctSoundChannel = audio.play(correctSound)

        RemoveAllTouchListeners()
        HideImages()

    
        if (points == 5) then
            composer.gotoScene( "YouWin_screen" )

            -- play correct sound 
            correctSoundChannel = audio.play(correctSound)

        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
        end        

    end
end

local function TouchListenerWrongAnswer(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)

        --object:removeEventListener("touch", TouchListenerWrongAnswer1)
        RemoveAllTouchListeners()
        HideImages()

        incorrect.isVisible = true
        correct.isVisible = false

        wrongSoundChannel = audio.play(wrongSound)

        print("wronganswer1")

        if (lives == 3) then
            aidKit1.isVisible = false
        elseif (lives == 2) then
            aidKit2.isVisible = false
        elseif (lives == 1) then
            aidKit3.isVisible = false
        end
        
        if (lives == 0) then
            composer.gotoScene( "YouLose_screen" )

            -- play incorrect sound 
            wrongSoundChannel = audio.play(wrongSound)

        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
            --AskQuestionLevel1()
        end        

    end
end

function RemoveTouchListenersQ1()
    :removeEventListener("touch", TouchListenerAnswer)
    :removeEventListener("touch", TouchListenerWrongAnswer1)       
    :removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ2()
    :removeEventListener("touch", TouchListenerAnswer)
    :removeEventListener("touch", TouchListenerWrongAnswer1)       
    :removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveAllTouchListeners()
    if (randomOperator == 1) then
        RemoveTouchListenersQ1()
    elseif (randomOperator == 2) then
        RemoveTouchListenersQ2()
   	end
end

function NewQuestionTimer()
    if (lives == 3) then
        HideImages()
        RemoveAllTouchListeners()
        AskQuestionLevel1()
    elseif (lives == 2) then
        HideImages()
        RemoveAllTouchListeners()
        AskQuestionLevel1()
    elseif (lives == 1) then
        HideImages()
        RemoveAllTouchListeners()
        AskQuestionLevel1()
    elseif (lives == 0) then
        HideImages()
        RemoveAllTouchListeners()
        composer.gotoScene( "YouLose_screen" )
    end
end

function AskQuestionLevel1()
    randomOperator = math.random (1, 15)

    incorrect.isVisible = false
    correct.isVisible = false
    HideImages()

    if (randomOperator == 1) then
        -- question
        .isVisible = true

        -- correct answer
        .isVisible = true
        :addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        .isVisible = true
        :addEventListener("touch", TouchListenerWrongAnswer1)

        .isVisible = true
        :addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 2) then
        
        -- question
        .isVisible = true

        -- correct answer
        .isVisible = true
        :addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        .isVisible = true
        :addEventListener("touch", TouchListenerWrongAnswer1)

        .isVisible = true
        :addEventListener("touch", TouchListenerWrongAnswer1)
    end
end

-- hide correctObject
local function HideCorrect()
    correct.isVisible = false
    AskQuestionLevel()
end--]]


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------------------------------------------
    -- OBJECT CREATION 
    -----------------------------------------------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images for level one/level3screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- create the lives to display on the screen 
    aidKit1 = display.newImageRect("Images for level one/AidKit.png", 130, 100)
    aidKit1.x = display.contentWidth /4
    aidKit1.y = display.contentHeight/1.75
    aidKit1.isVisible = true

    aidKit2 = display.newImageRect("Images for level one/AidKit.png", 130, 100)
    aidKit2.x = display.contentWidth /2
    aidKit2.y = display.contentHeight/1.75
    aidKit2.isVisible = true

    aidKit3 = display.newImageRect("Images for level one/AidKit.png", 130, 100)
    aidKit3.x = display.contentWidth /1.3
    aidKit3.y = display.contentHeight/1.75
    aidKit3.isVisible = true

    --[[correct = display.newText("CORRECT!", display.contentWidth/2, display.contentHeight*2.5/4, nil, 100 )
    correct:setTextColor(153/255, 76/255, 0)
    correct.isVisible = false

    incorrect = display.newText("INCORRECT!", display.contentWidth/2, display.contentHeight*2.5/4, nil, 100 )
    incorrect:setTextColor(153/255, 76/255, 0)
    incorrect.isVisible = false

    -- questions 
     = display.newImageRect("Images for level one/.png", 250, 250)
    .x = display.contentWidth /1.9
    .y = display.contentHeight/2.1
    .isVisible = false

     = display.newImageRect("Images for level one/.png", 250, 250)
    .x = display.contentWidth /1.9
    .y = display.contentHeight/2.1
    .isVisible = false
    .name = ""--]]

    
-----------------------------------------------------------------------------------------------------------------------------

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( aidKit1 )
    sceneGroup:insert( aidKit2 )
    sceneGroup:insert( aidKit3 )
    
end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene

    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        lives = 3
        points = 0        

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
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