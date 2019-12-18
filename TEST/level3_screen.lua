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

    local ice
    local tweezers
    local bandaid
    local polysporin

    -- lives 
    local lives = 3
    
    local aidKit1
    local aidKit2
    local aidKit3

    local points = 0
    --local correct
    --local incorrect

    -----------------------------------------------------------------------------------------

    -- sound
    local correctSound = audio.loadSound("Sounds/CorrectSound.wav")
    local correctSoundChannel
    local wrongSound = audio.loadSound("Sounds/IncorrectSound.mp3")
    local wrongSoundChannel

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

local function HideImages()
    question1.isVisible = false
    question2.isVisible = false
    bandaid.isVisible = false
    bandaid.isVisible = false
end 

local function ShowKits()
    aidKit1.isVisible = true
    aidKit2.isVisible = true
    aidKit3.isVisible = true
end

function TouchListenerAnswerL3(event)
    -- get the object name that was clicked
    local object = event.target

    -- get the user answer from the text object that was clicked on    

    if (event.phase == "ended") then

        print("correct")
        --correct.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        --print (points)
        points = points + 1

        correctSoundChannel = audio.play(correctSound)

        RemoveAllTouchListenersL3()
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

function TouchListenerWrongAnswerL3(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)

        --object:removeEventListener("touch", TouchListenerWrongAnswer1)
        RemoveAllTouchListenersL3()
        HideImages()

        --incorrect.isVisible = true
        --correct.isVisible = false

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

function RemoveTouchListenersQ1L3()
    ice:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ2L3()
    polysporin:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveAllTouchListenersL3()
    if (randomOperator == 1) then
        RemoveTouchListenersQ1L3()
    elseif (randomOperator == 2) then
        RemoveTouchListenersQ2L3()
   	end
end

function NewQuestionTimerL3()
    if (lives == 3) then
        HideImages()
        RemoveAllTouchListenersL3()
        AskQuestionLevel3()
    elseif (lives == 2) then
        HideImages()
        RemoveAllTouchListenersL3()
        AskQuestionLevel3()
    elseif (lives == 1) then
        HideImages()
        RemoveAllTouchListenersL3()
        AskQuestionLevel3()
    elseif (lives == 0) then
        HideImages()
        RemoveAllTouchListenersL3()
        composer.gotoScene( "YouLose_screen" )
    end
end

function AskQuestionLevel3()
    randomOperator = math.random (1, 2)
    print("Asked question")
    --incorrect.isVisible = false
    --correct.isVisible = false
    HideImages()

    if (randomOperator == 1) then
        -- question
        question1.isVisible = true

        -- correct answer
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerAnswerL3)

        -- wrong answers
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswerL3)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswerL3)

    elseif (randomOperator == 2) then
        
        -- question
        question2.isVisible = true

        -- correct answer
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerAnswerL3)

        -- wrong answers
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswerL3)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswerL3)
    end
end

-- hide correctObject
local function HideCorrect()
    correct.isVisible = false
    AskQuestionLevel3()
end


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

 
    -- questions 
    question1 = display.newText("Hey!", display.contentWidth/2, display.contentHeight/8.7, nil, 60 )
    question1:setTextColor(153/255, 76/255, 0)
    question1.isVisible = false

    question2 = display.newText("Hi!", display.contentWidth/2, display.contentHeight/8.7, nil, 60 )
    question2:setTextColor(153/255, 76/255, 0)
    question2.isVisible = false

    -- answers
    ice = display.newImageRect("Images for level one/IceBag1.png", 190, 190)
    ice.x = display.contentWidth /1.25
    ice.y = display.contentHeight/1.2
    ice.isVisible = false
    ice.name = "ice"

    polysporin = display.newImageRect("Images for level one/Polysporin.png", 190, 190)
    polysporin.x = display.contentWidth /1.25
    polysporin.y = display.contentHeight/1.2
    polysporin.isVisible = false
    polysporin.name = "polysporin"

    bandaid = display.newImageRect("Images for level one/Bandaid3.png", 220, 190)
    bandaid.x = display.contentWidth /1.9
    bandaid.y = display.contentHeight/1.17
    bandaid.isVisible = false
    bandaid.name = "bandaid"

    tweezers = display.newImageRect("Images for level one/Tweezers.png", 190, 190)
    tweezers.x = display.contentWidth /4.
    tweezers.y = display.contentHeight/1.2
    tweezers.isVisible = false
    tweezers.name = "tweezers"

    
-----------------------------------------------------------------------------------------------------------------------------

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( aidKit1 )
    sceneGroup:insert( aidKit2 )
    sceneGroup:insert( aidKit3 )
    sceneGroup:insert( ice )
    sceneGroup:insert( bandaid )
    sceneGroup:insert( tweezers )
    sceneGroup:insert( polysporin )
    
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

        ShowKits()
        AskQuestionLevel3()    

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