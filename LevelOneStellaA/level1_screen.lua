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
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

    -- sound
    local correctSound = audio.loadSound("Sounds/CorrectSound.wav")
    local correctSoundChannel
    local wrongSound = audio.loadSound("Sounds/IncorrectSound.mp3")
    local wrongSoundChannel
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

    local points = 0

    local correct
    local incorrect

    -- answer Images
    local ice
    local bandaid
    local tweezers
    local polysporin
    local tums
    local advil

    -- question Images
    local bruises
    local cuts
    local splinters
    local beeSting
    local rugBurn
    local stomachAche
    local headAche

    local randomOperator


    -- variables for the tier 
    local TOTAL_SECONDS = 15
    local secondsLeft = 15
    local clockText
    local countDownTimer  

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function HideImages()
    bruises.isVisible = false
    cuts.isVisible = false
    ice.isVisible = false
    splinters.isVisible = false
    beeSting.isVisible = false
    bandaid.isVisible = false
    tweezers.isVisible = false
    polysporin.isVisible = false
    rugBurn.isVisible = false
    headAche.isVisible = false
    stomachAche.isVisible = false
    advil.isVisible = false
    tums.isVisible = false
end 

local function ShowDrops()
    drop1.isVisible = true
    drop2.isVisible = true
    drop3.isVisible = true
end

-------------------------------------------------------------------------------------------------------------------------
-- hide correctObject
local function HideCorrect()
    correct.isVisible = false
    AskQuestionLevel()
end


-- Functions that checks if the buttons have been clicked.
local function TouchListenerAnswer(event)
    -- get the object name that was clicked
    local object = event.target

    -- get the user answer from the text object that was clicked on    

    if (event.phase == "ended") then
        print("***correct")
        correct.isVisible = true
        timer.performWithDelay(1000, HideCorrect)
        --increment points
        --print (points)
        points = points + 1    
        
        correctSoundChannel = audio.play(correctSound)

        secondsLeft = 15
        --incorrect.isVisible = false
        --print("***object.name = " .. object.name)

        RemoveAllTouchListeners()
        HideImages()

 
        

        if (points == 5) then
            composer.gotoScene( "YouWin_screen" )
            -- increase the number correct by 1
            --numberCorrect = numberCorrect + 1

            -- play correct sound 
            --correctSoundChannel = audio.play(correctSound)

            -- call RestartScene after 1 second
            --timer.performWithDelay( 1000, RestartScene )
        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
            --AskQuestionLevel1()
        end        

    end
end

local function UpdateDrops()
    if (lives == 3) then
        drop1.isVisible = true
        drop2.isVisible = true
        drop3.isVisible = true
    elseif (lives == 2) then
        drop1.isVisible = false
        drop2.isVisible = true
        drop3.isVisible = true
    elseif (lives == 1) then
        drop3.isVisible = true
        drop1.isVisible = false
        drop2.isVisible = false
    elseif (lives == 0) then
        drop3.isVisible = false
        drop1.isVisible = false
        drop2.isVisible = false
    end
end 

local function TouchListenerWrongAnswer1(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)
        --object:removeEventListener("touch", TouchListenerWrongAnswer1)
        --RemoveTouchListenersQ1()
        RemoveAllTouchListeners()
        HideImages()

        incorrect.isVisible = true
        correct.isVisible = false

        wrongSoundChannel = audio.play(wrongSound)

        print("wronganswer1")

        UpdateDrops()
        
        if (lives == 0) then
            composer.gotoScene( "YouLose_screen" )         
        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
        end        

    end
end

local function TouchListenerWrongAnswer2(event)
    local object = event.target
    -- get the user answer from the text object that was clicked on
    if (event.phase == "ended") then

        lives = lives - 1
        print("***object.name = " .. object.name)
        --object:removeEventListener("touch", TouchListenerWrongAnswer2)
        --RemoveTouchListenersQ1()
        RemoveAllTouchListeners()
        HideImages()
        
        incorrect.isVisible = true
        correct.isVisible = false

        wrongSoundChannel = audio.play(wrongSound)
        
        print("wronganswer2")

        if (lives == 3) then
            drop1.isVisible = false
            secondsLeft = 15
        elseif (lives == 2) then
            drop2.isVisible = false
            secondsLeft = 15
        elseif (lives == 1) then
            drop3.isVisible = false
            secondsLeft = 15
        end
        
        if (lives == 0) then
            composer.gotoScene( "YouLose_screen" )
            -- increase the number correct by 1
            --numberCorrect = numberCorrect + 1
            incorrect.isVisible = false
            -- play correct sound 
            --correctSoundChannel = audio.play(correctSound)

            -- call RestartScene after 1 second
            --timer.performWithDelay( 1000, RestartScene )
        else
            timer.performWithDelay( 1000, AskQuestionLevel1 )
            --incorrect.isVisible = false
        end        

    end
end

function RemoveTouchListenersQ1()
    ice:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ2()
    polysporin:removeEventListener("touch", TouchListenerAnswer)
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ3()
    tweezers:removeEventListener("touch", TouchListenerAnswer)
    ice:removeEventListener("touch", TouchListenerWrongAnswer1)       
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer2)   
end

function RemoveTouchListenersQ4()
    bandaid:removeEventListener("touch", TouchListenerAnswer)
    polysporin:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ5()
    polysporin:removeEventListener("touch", TouchListenerAnswer)
    tums:removeEventListener("touch", TouchListenerWrongAnswer1)       
    tweezers:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ6()
    advil:removeEventListener("touch", TouchListenerAnswer)
    polysporin:removeEventListener("touch", TouchListenerWrongAnswer1)       
    bandaid:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveTouchListenersQ7()
    tums:removeEventListener("touch", TouchListenerAnswer)
    ice:removeEventListener("touch", TouchListenerWrongAnswer1)       
    advil:removeEventListener("touch", TouchListenerWrongAnswer2)
end

function RemoveAllTouchListeners()
    if (randomOperator == 1) then
        RemoveTouchListenersQ1()
    elseif (randomOperator == 2) then
        RemoveTouchListenersQ2()
    elseif (randomOperator == 3) then
        RemoveTouchListenersQ3()
    elseif (randomOperator == 4) then
        RemoveTouchListenersQ4()
    elseif (randomOperator == 5) then
        RemoveTouchListenersQ5()
    elseif (randomOperator == 6) then
        RemoveTouchListenersQ6()
    elseif (randomOperator == 7) then
        RemoveTouchListenersQ7()
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
    randomOperator = math.random (1, 7)
    --randomOperator = 6

    --print(randomOperator) 
    --print(lives)
    --print(points)

    incorrect.isVisible = false
    correct.isVisible = false
    HideImages()

    if (randomOperator == 1) then
        -- question
        bruises.isVisible = true

        -- correct answer
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
       -- cuts.isVisible = true
        --cuts:addEventListener("touch", TouchListenerWrongAnswer1)
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer1)

        --splinters.isVisible = true
       -- splinters:addEventListener("touch", TouchListenerWrongAnswer2)
        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 2) then
        
        -- question
        beeSting.isVisible = true

        -- correct answer
        --cuts.isVisible = true
        --cuts:addEventListener("touch", TouchListenerAnswer)
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer1)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer2)
        --advil.isVisible = true
        --advil:addEventListener("touch", TouchListenerWrongAnswer2)


    elseif (randomOperator == 3) then

        --question
        splinters.isVisible = true

        -- correct answer
        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerAnswer)

        -- wrong answers
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerWrongAnswer1)

        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer2)
        --tums.isVisible = true
        --tums:addEventListener("touch", TouchListenerWrongAnswer2)
    
    elseif (randomOperator == 4) then

        -- question
        cuts.isVisible = true

        -- correct answer
        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerWrongAnswer1)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 5) then
        -- question
        rugBurn.isVisible = true

        -- correct answer
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        tums.isVisible = true
        tums:addEventListener("touch", TouchListenerWrongAnswer1)

        tweezers.isVisible = true
        tweezers:addEventListener("touch", TouchListenerWrongAnswer2)

    elseif (randomOperator == 6) then

        -- question
        headAche.isVisible = true

        -- correct answer
        advil.isVisible = true
        advil:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        polysporin.isVisible = true
        polysporin:addEventListener("touch", TouchListenerWrongAnswer1)

        bandaid.isVisible = true
        bandaid:addEventListener("touch", TouchListenerWrongAnswer2)



    elseif (randomOperator == 7) then

        -- question
        stomachAche.isVisible = true

        -- correct answer
        tums.isVisible = true
        tums:addEventListener("touch", TouchListenerAnswer)
        
        -- wrong answers
        ice.isVisible = true
        ice:addEventListener("touch", TouchListenerWrongAnswer1)

        advil.isVisible = true
        advil:addEventListener("touch", TouchListenerWrongAnswer2)
    end
end

-------------------------------------------------------------------------------------------
-- UPDATE TIMER
local function UpdateTime()

    -- decrement the number of seconds
    secondsLeft = secondsLeft - 1

    -- display the number of seconds left in the clock object
    clockText.text = secondsLeft .. ""

    if (secondsLeft == 0) then 
        -- reset the number of seconds left
        secondsLeft = TOTAL_SECONDS

        -- subtract a live after time runs out
        lives = lives - 1

        --play the sound on any available channel
        wrongSoundChannel = audio.play(wrongSound)

        -- if time runs out, lose a life by making harets invisible
        if (lives == 3) then
            drop1.isVisible = false
            RemoveAllTouchListeners()
            AskQuestionLevel1()
        elseif (lives == 2) then
            drop2.isVisible = false
            RemoveAllTouchListeners()
            AskQuestionLevel1()
        elseif (lives == 1) then
            drop3.isVisible = false
            RemoveAllTouchListeners()
            AskQuestionLevel1()
        elseif (lives == 0) then -- if you lose all lives, make everything disappear
            RemoveAllTouchListeners()        

            -- Go to the intro screen
            composer.gotoScene( "YouLose_screen" )
        end
    end
end 

-----------------------------------------------------------------------------------------------------------------------------

-- function the calls the timer 
local function StartTimer()
    -- create a countdown timer that loops infinftely
    countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
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
    drop1.isVisible = true

    drop2 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop2.x = display.contentWidth /11
    drop2.y = display.contentHeight/3
    drop2.isVisible = true

    drop3 = display.newImageRect("Images/redDrop.png", 100, 100)
    drop3.x = display.contentWidth /5
    drop3.y = display.contentHeight/3
    drop3.isVisible = true

    correct = display.newText("CORRECT!", display.contentWidth/2, display.contentHeight*2.5/4, nil, 100 )
    --*1.1/4
    correct:setTextColor(153/255, 76/255, 0)
    correct.isVisible = false

    incorrect = display.newText("INCORRECT!", display.contentWidth/2, display.contentHeight*2.5/4, nil, 100 )
    incorrect:setTextColor(153/255, 76/255, 0)
    incorrect.isVisible = false

    -- questions 
    bruises = display.newImageRect("Images for level one/Bruises.png", 250, 250)
    bruises.x = display.contentWidth /2
    bruises.y = display.contentHeight/1.9
    bruises.isVisible = false

    cuts = display.newImageRect("Images for level one/Cuts.png", 250, 250)
    cuts.x = display.contentWidth /2
    cuts.y = display.contentHeight/1.9
    cuts.isVisible = false
    cuts.name = "cuts"

    splinters = display.newImageRect("Images for level one/Slinters.png", 250, 250)
    splinters.x = display.contentWidth /2
    splinters.y = display.contentHeight/1.9
    splinters.isVisible = false
    splinters.name = "splinters"

    beeSting = display.newImageRect("Images for level one/Bee Sting.png", 250, 250)
    beeSting.x = display.contentWidth /2
    beeSting.y = display.contentHeight/1.9
    beeSting.isVisible = false
    beeSting.name = "beeSting"

    rugBurn = display.newImageRect("Images for level one/RugBurn.png", 250, 250)
    rugBurn.x = display.contentWidth /2
    rugBurn.y = display.contentHeight/1.9
    rugBurn.isVisible = false
    rugBurn.name = "rugBurn"

    stomachAche = display.newImageRect("Images for level one/StomachAche.png", 250, 250)
    stomachAche.x = display.contentWidth /2
    stomachAche.y = display.contentHeight/1.9
    stomachAche.isVisible = false
    stomachAche.name = "stomachAche"

    headAche = display.newImageRect("Images for level one/HeadAche.png", 250, 250)
    headAche.x = display.contentWidth /2
    headAche.y = display.contentHeight/1.9
    headAche.isVisible = false
    headAche.name = "headAche"


    --answers
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
    bandaid.x = display.contentWidth /2
    bandaid.y = display.contentHeight/1.16
    bandaid.isVisible = false
    bandaid.name = "bandaid"

    tweezers = display.newImageRect("Images for level one/Tweezers.png", 190, 190)
    tweezers.x = display.contentWidth /5
    tweezers.y = display.contentHeight/1.2
    tweezers.isVisible = false
    tweezers.name = "tweezers"

    advil = display.newImageRect("Images for level one/Advil.png", 190, 190)
    advil.x = display.contentWidth /5
    advil.y = display.contentHeight/1.15
    advil.isVisible = false
    advil.name = "advil"

    tums = display.newImageRect("Images for level one/Tums2.png", 190, 190)
    tums.x = display.contentWidth /2
    tums.y = display.contentHeight/1.16
    tums.isVisible = false
    tums.name = "tums"


    -- displays a question and sets the colour
    questionObject = display.newText( "What tool do you use to help your patient?", display.contentWidth/1.635, display.contentHeight/3, nil, 40)
    questionObject:setTextColor(0, 102/255, 102/255)


        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( drop1 )
    sceneGroup:insert( drop2 )
    sceneGroup:insert( drop3 )
    sceneGroup:insert( questionObject ) 
    sceneGroup:insert( correct )
    sceneGroup:insert( incorrect )
    sceneGroup:insert( bruises )
    sceneGroup:insert( beeSting )
    sceneGroup:insert( cuts )
    sceneGroup:insert( splinters )
    sceneGroup:insert( ice )
    sceneGroup:insert( bandaid )
    sceneGroup:insert( tweezers )
    sceneGroup:insert( polysporin )
    sceneGroup:insert( rugBurn )
    sceneGroup:insert( headAche )
    sceneGroup:insert( stomachAche )
    sceneGroup:insert( advil )
    sceneGroup:insert( tums )
    sceneGroup:insert( clockText )

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
        secondsLeft = 15
        lives = 3
        points = 0        

        StartTimer()
        ShowDrops()
        AskQuestionLevel1()

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
        RemoveAllTouchListeners()
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
