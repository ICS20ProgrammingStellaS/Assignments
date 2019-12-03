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
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )


-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image

local questionObject

-- lives 
local lives = 3
local drop1
local drop2
local drop3

-- question Images
local ice
local bruises
local cuts
local splinters
local beeSting

local randomOperator

-- variables for the timer 
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer  

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function AskQuestion()
    randomOperator = math.random (1, 2)

    if (randomOperator == 1) then

        -- correct answer
        ice.isVisible = true

        -- question
        bruises.isVisible = true

        -- wrong answers
        cuts.isVisible = true
        splinters.isVisible = true

    elseif (randomOperator == 2) then

        -- correct answer
        cuts.isVisible = true

        -- question
        beeSting.isVisible = true

        -- wrong answers
        ice.isVisible = true
        splinters.isVisible = true
    end
        --TouchListenerAnswer()
        --TouchListenerWrongAnswer1()
        --TouchListenerWrongAnswer2()
end

-- Functions that checks if the buttons have been clicked.
--[[local function TouchListenerAnswer(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = ice

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true

        -- if the user gets the answer right, display Correct and call RestartSceneRight
        if (answer == tonumber(userAnswer)) then     
            correct.isVisible = true
            -- increase the number correct by 1
            --numberCorrect = numberCorrect + 1

            -- play correct sound 
            --correctSoundChannel = audio.play(correctSound)

            -- call RestartScene after 1 second
            timer.performWithDelay( 1000, RestartScene )
        end --]]       

    --end
--end

--local function TouchListenerWrongAnswer1(touch)
    -- get the user answer from the text object that was clicked on
    --local userAnswer = cuts

    --if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        --alreadyClickedAnswer = true


        --if (answer ~= tonumber(userAnswer)) then
            -- decrease a life
            --lives = lives - 1

            -- play incorrect sound 
            --wrongSoundChannel = audio.play(wrongSound)

            -- call RestartScene after 1 second
           -- timer.performWithDelay( 1000, RestartScene )            
        --end        

    --end
--end

--local function TouchListenerWrongAnswer2(touch)
    -- get the user answer from the text object that was clicked on
    --local userAnswer = splinters

      
        --if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

           -- alreadyClickedAnswer = true


           -- if (answer ~= tonumber(userAnswer)) then
                -- decrease a life
            --    lives = lives - 1

                -- play incorrect sound 
              --  wrongSoundChannel = audio.play(wrongSound)

                -- call RestartScene after 1 second
               -- timer.performWithDelay( 1000, RestartScene )            
            --end        
    
       -- end
--end

-------------------------------------------------------------------------------------------------
-- UPDATE TIMER
local function UpdateTime()

    -- decrement the number of seconds
    secondsLeft = secondsLeft - 1

    -- display the number of seconds left in the clock object
    clockText.text = secondsLeft .. ""

    if (secondsLeft == 0) then 
        -- reset the number of seconds left
        secondsLeft = totalSeconds

        -- subtract a live after time runs out
        lives = lives - 1

        -- ask another question
        --AskQuestion()

        --play the sound on any available channel
        --wrongSoundChannel = audio.play(wrongSound)

        -- *** IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND, SHOW A YOU LOSE IMAGE 
        -- AND CANCLE THE TIMER REMOVE THE THIRD HEART BY MAKING IT INVISIBLE

        -- if time runs out, lose a life by making harets invisible
        if (lives == 3) then
            drop1.isVisible = false
        elseif (lives == 2) then
            drop2.isVisible = false
        elseif (lives == 1) then
            drop3.isVisible = false
        elseif (lives == 0) then -- if you lose all lives, make everything disappear
            --drop2.isVisible = false
            --drop1.isVisible = false
            clockText.isVisible = false
            --questionObject.isVisible = false

            -- Go to the intro screen
            composer.gotoScene( "YouLose_screen" )

        end

        
        -- *** CALL THE FUNCTION TO ASK A NEW QUESTION

    end
end 

-----------------------------------------------------------------------------------------------------------------------------

-- function the calls the timer 
local function StartTimer()
    -- create a countdown timer that loops infinftely
    countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

-------------------------------------------------------------------------------------------------------------------------
-- hide correctObject
local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
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
    bkg_image = display.newImageRect("Images/Level1Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- display timer on screen
    clockText = display.newText("", 100, 100, nil, 70)
    clockText.x = display.contentWidth*2.8/4
    clockText.y = display.contentHeight/8

    -- create the lives to display on the screen 
    drop1 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop1.x = display.contentWidth /7
    drop1.y = display.contentHeight/2.5

    drop2 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop2.x = display.contentWidth /11
    drop2.y = display.contentHeight/3

    drop3 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop3.x = display.contentWidth /5
    drop3.y = display.contentHeight/3

    -- questions 
    bruises = display.newImageRect("Images for level one/Bruises.png", 230, 230)
    bruises.x = display.contentWidth /2
    bruises.y = display.contentHeight/1.7
    bruises.isVisible = false

    cuts = display.newImageRect("Images for level one/Cuts.png", 190, 190)
    cuts.x = display.contentWidth /2
    cuts.y = display.contentHeight/1.16
    cuts.isVisible = false

    splinters = display.newImageRect("Images for level one/Slinters.png", 190, 190)
    splinters.x = display.contentWidth /5
    splinters.y = display.contentHeight/1.15
    splinters.isVisible = false

    --answers
    ice = display.newImageRect("Images for level one/IceBag.png", 190, 190)
    ice.x = display.contentWidth /1.25
    ice.y = display.contentHeight/1.2
    ice.isVisible = false

    beeSting = display.newImageRect("Images for level one/Bee Sting.png", 200, 200)
    beeSting.x = display.contentWidth /2
    beeSting.y = display.contentHeight/1.7
    beeSting.isVisible = false


-----------------------------------------------------------------------------------------------------------------------------

    -- displays a question and sets the colour
    questionObject = display.newText( " What tool do you use to help your patient? ", display.contentWidth/1.6, display.contentHeight/2.5, nil, 40)
    questionObject:setTextColor(0, 102/255, 102/255)


        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( drop1 )
    sceneGroup:insert( drop2 )
    sceneGroup:insert( questionObject ) 

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
        StartTimer()
        AskQuestion()

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
        timer.cancel(countDownTimer)
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
