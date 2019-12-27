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
sceneName = "leve3_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

    -- The local variables for this scene
    local bkg_image

    -- lives 
    local lives = 3
    
    local aidKit1
    local aidKit2
    local aidKit3

    local points = 0
    local correct
    local incorrect

    -- answer Images
    local hug
    local yell
    local ignore
    local tissue
    local happy
    local rude
    local help
    local laugh

    -- question Images
    local question1
    local question2
    local question3
    local question4
    local question5

    local randomOperator

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

    -- sound
    local correctSound = audio.loadSound("Sounds/CorrectSound.wav")
    local correctSoundChannel
    local wrongSound = audio.loadSound("Sounds/IncorrectSound.mp3")
    local wrongSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function HideImages()
    question1.isVisible = false
    hug.isVisible = false
    question2.isVisible = false
    question3.isVisible = false
    question4.isVisible = false
    question5.isVisible = false
    yell.isVisible = false
    ignore.isVisible = false
    tissue.isVisible = false
    laugh.isVisible = false
    help.isVisible = false
    happy.isVisible = false
    rude.isVisible = false
end 

local function ShowDrops()
    aidKit1.isVisible = true
    aidKit2.isVisible = true
    aidKit3.isVisible = true
end

-- Functions that checks if the buttons have been clicked.
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

        RemoveAllTouchListenersL3()
        HideImages()

    
        if (points == 5) then
            composer.gotoScene( "YouWin_screen" )

            -- play correct sound 
            --correctSoundChannel = audio.play(correctSound)

        else
            timer.performWithDelay( 1000, AskQuestionLevel3 )
        end        

    end
end

local function TouchListenerWrongAnswer1(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)

        --object:removeEventListener("touch", TouchListenerWrongAnswer1)
        RemoveAllTouchListenersL3()
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
            --wrongSoundChannel = audio.play(wrongSound)

        else
            timer.performWithDelay( 1000, AskQuestionLevel3 )
            --AskQuestionLevel1()
        end        

    end
end

function RemoveTouchListenersQ1L3()
    tissue:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    hug:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ2L3()
    hug:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ3L3()
    happy:removeEventListener("touch", TouchListenerAnswer)
    tissue:removeEventListener("touch", TouchListenerWrongAnswer1)       
    rude:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ4L3()
    help:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    ignore:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveTouchListenersQ5L3()
    help:removeEventListener("touch", TouchListenerAnswer)
    yell:removeEventListener("touch", TouchListenerWrongAnswer1)       
    laugh:removeEventListener("touch", TouchListenerWrongAnswer1)
end

function RemoveAllTouchListenersL3()
    if (randomOperator == 1) then
        RemoveTouchListenersQ1L3()
    elseif (randomOperator == 2) then
        RemoveTouchListenersQ2L3()
    elseif (randomOperator == 3) then
        RemoveTouchListenersQ3L3()
    elseif (randomOperator == 4) then
        RemoveTouchListenersQ4L3()
    elseif (randomOperator == 5) then
        RemoveTouchListenersQ5L3()
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
    randomOperator = math.random (1, 5)

    incorrect.isVisible = false
    correct.isVisible = false
    HideImages()

    if (randomOperator == 1) then
        -- question
        question1.isVisible = true

        -- correct answer
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        hug.isVisible = true
        hug:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 2) then
        
        -- question
        question2.isVisible = true

        -- correct answer
        hug.isVisible = true
        hug:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 3) then
        
        -- question
        question3.isVisible = true

        -- correct answer
        happy.isVisible = true
        happy:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        tissue.isVisible = true
        tissue:addEventListener("touch", TouchListenerWrongAnswer1)

        rude.isVisible = true
        rude:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 4) then
        
        -- question
        question4.isVisible = true

        -- correct answer
        help.isVisible = true
        help:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        ignore.isVisible = true
        ignore:addEventListener("touch", TouchListenerWrongAnswer1)

    elseif (randomOperator == 5) then
        
        -- question
        question5.isVisible = true

        -- correct answer
        help.isVisible = true
        help:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        yell.isVisible = true
        yell:addEventListener("touch", TouchListenerWrongAnswer1)

        laugh.isVisible = true
        laugh:addEventListener("touch", TouchListenerWrongAnswer1)

    end
end

-------------------------------------------------------------------------------------------------------------------------
-- hide correctObject
local function HideCorrect()
    correct.isVisible = false
    AskQuestionLevel3()
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------------------------------------------
    -- OBJECT CREATION 
    -----------------------------------------------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images for level one/BackGround.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- create the lives to display on the screen 
    aidKit1 = display.newImageRect("Images for level one/AidKit.png", 130, 100)
    aidKit1.x = display.contentWidth /1.3
    aidKit1.y = display.contentHeight/1.75
    aidKit1.isVisible = true

    aidKit2 = display.newImageRect("Images for level one/AidKit.png", 130, 100)
    aidKit2.x = display.contentWidth /4
    aidKit2.y = display.contentHeight/1.75
    aidKit2.isVisible = true

    aidKit3 = display.newImageRect("Images for level one/AidKit.png", 130, 100)
    aidKit3.x = display.contentWidth /2
    aidKit3.y = display.contentHeight/1.75
    aidKit3.isVisible = true

    correct = display.newText("Good Job!", display.contentWidth/2, display.contentHeight*3/4, nil, 75 )
    correct:setTextColor(153/255, 76/255, 0)
    correct.isVisible = false

    incorrect = display.newText("Oops wrong answer!", display.contentWidth/2, display.contentHeight*3/4, nil, 75 )
    incorrect:setTextColor(153/255, 76/255, 0)
    incorrect.isVisible = false

    -- questions 
    question1 = display.newText("someone is crying?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question1:setTextColor(153/255, 76/255, 0)
    question1.isVisible = false

    question2 = display.newText("someone is sad?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question2:setTextColor(153/255, 76/255, 0)
    question2.isVisible = false

    question3 = display.newText("someone is happy?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question3:setTextColor(153/255, 76/255, 0)
    question3.isVisible = false

    question4 = display.newText("someone is confused?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question4:setTextColor(153/255, 76/255, 0)
    question4.isVisible = false

    question5 = display.newText("someone is embarrased?", display.contentWidth/2, display.contentHeight/4.75, nil, 55 )
    question5:setTextColor(153/255, 76/255, 0)
    question5.isVisible = false

    --answers
    hug = display.newImageRect("Images for level one/Hug.png", 180, 170)
    hug.x = display.contentWidth /1.3
    hug.y = display.contentHeight/1.2
    hug.isVisible = false
    hug.name = "hug"

    yell = display.newImageRect("Images for level one/Yell.png", 180, 190)
    yell.x = display.contentWidth /1.95
    yell.y = display.contentHeight/1.2
    yell.isVisible = false
    yell.name = "yell"

    ignore = display.newImageRect("Images for level one/Ignore.png", 200, 180)
    ignore.x = display.contentWidth /4
    ignore.y = display.contentHeight/1.2
    ignore.isVisible = false
    ignore.name = "ignore"

    tissue = display.newImageRect("Images for level one/GiveTissue.png", 200, 180)
    tissue.x = display.contentWidth /4
    tissue.y = display.contentHeight/1.18
    tissue.isVisible = false
    tissue.name = "tissue"

    happy = display.newImageRect("Images for level one/Behappytoo.png", 200, 180)
    happy.x = display.contentWidth /1.95
    happy.y = display.contentHeight/1.2
    happy.isVisible = false
    happy.name = "happy"

    rude = display.newImageRect("Images for level one/Berude.png", 200, 180)
    rude.x = display.contentWidth /1.3
    rude.y = display.contentHeight/1.21
    rude.isVisible = false
    rude.name = "rude"

    help = display.newImageRect("Images for level one/Helpthem.png", 200, 180)
    help.x = display.contentWidth /1.3
    help.y = display.contentHeight/1.2
    help.isVisible = false
    help.name = "help"

    laugh = display.newImageRect("Images for level one/Laughatthem.png", 230, 190)
    laugh.x = display.contentWidth /4
    laugh.y = display.contentHeight/1.2
    laugh.isVisible = false
    laugh.name = "laugh"



-----------------------------------------------------------------------------------------------------------------------------

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( aidKit1 )
    sceneGroup:insert( aidKit2 )
    sceneGroup:insert( aidKit3 )
    sceneGroup:insert( correct )
    sceneGroup:insert( incorrect )
    sceneGroup:insert( question1 )
    sceneGroup:insert( question2 )
    sceneGroup:insert( question3 )
    sceneGroup:insert( question4 )
    sceneGroup:insert( question5 )
    sceneGroup:insert( hug )
    sceneGroup:insert( yell )
    sceneGroup:insert( ignore )
    sceneGroup:insert( tissue )
    sceneGroup:insert( help )
    sceneGroup:insert( rude )
    sceneGroup:insert( happy )
    sceneGroup:insert( laugh )

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

        ShowDrops()
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
