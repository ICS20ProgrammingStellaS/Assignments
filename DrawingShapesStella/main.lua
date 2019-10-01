-- Title: DrawingShapes
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays multiple shapes

-- create my local variables
local textSize = 50
local myTriangle
local trianlgeText
local AreaOfTriangle
local myTrapezoid
local trapezoidText
local myPentagon
local pentagonText
local myHexagon
local hexagonText
local myOctagon
local octagonText
local myQuadrilateral
local quadrilateralText
local triangleV = {135, 90, -135, 90, 0, -90}
local trapezoidV = {-60, -90, 60, -90, 120, 60, -120, 60}
local pentagonV = {-120, -30, 0, -90, 120, -30, 60, 60, -60, 60}
local hexagonV = {-180, 0, -80, -80, 80, -80, 180, 0, 80, 80, -80, 80}
local octagonV = {-120, 0, -120, -60}
local quadrilateralV = {135, 90, -135, 90, 0, -90}

-- draw the triangle's location on the screens size. 
myTriangle = display.newPolygon(175, 200, triangleV)
-- draw the triangle's location on the screens size. 
myTrapezoid = display.newPolygon(525, 200, trapezoidV)
-- draw the triangle's location on the screens size. 
myPentagon = display.newPolygon(830, 200, pentagonV)
-- draw the triangle's location on the screens size. 
myHexagon = display.newPolygon(200, 525, hexagonV)
-- draw the triangle's location on the screens size. 
myOctagon = display.newPolygon(525, 525, octagonV)
-- draw the triangle's location on the screens size. 
myQuadrilateral = display.newPolygon(750, 525, quadrilateralV)

-- set the backround colour of my screen. 
-- Remember that colours are between 0 and 1
display.setDefault("background", 204/255, 255/255, 229/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)


-- draw the circle. 
myCircle = display.newCircle(650, 0, radiusOfCircle)

-- anchor the rectangle in the top left corner of the screen 
-- set the circle in the top right corner and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 630
myCircle.y = 20

-- set the width of the border for rectangle
myRectangle.strokeWidth = 20

-- set the colour of the rectangle
myRectangle:setFillColor(204/255, 255/255, 255/255)

-- set the color of the border of the rectangle
myRectangle:setStrokeColor(204/255, 204/255, 255/255)

-- set the color of the border of the circle 
myCircle:setStrokeColor(229/255, 204/255, 255/255)

-- calculate the area of the triangle
areaOfTriangle = baseOfTriangle * heightOfTriangle / 2


-- write the area of the triangle on the screen. Take into consideration the size of
-- the font when positioning it on the screen.
areaText = display.newText("The area of this triangle with a base of \n"..
	widthOfRectangle .. " and a height of " .. heightOfTriangle .. " is " ..
	areaOtriangle .. " pixels². ", 0, 0, Arial, textSize)


-- set the colour of the newText of the rectangle
areaText:setTextColor(255/255, 178/255, 102/255)

-- set the colour of the newText of the circle
areaTextCircle:setTextColor(255/255, 153/255, 153/255)











