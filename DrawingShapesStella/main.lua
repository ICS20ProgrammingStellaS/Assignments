-- Title: DrawingShapes
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays multiple shapes

-- create my local variables
local textSize = 50
local myTriangle
local trianlgeText
local areaText
local areaOfTriangle
local baseOfTriangle
local heightOfTriangle
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
local octagonV = {-120, 0, -120, -60, -60, -120, 60, -120, 120, -60, 120, 0, 60, 60, -60, 60}
local quadrilateralV = {-120, -60, -120, -180, 120, -60, 60, 60}

-- draw the triangle's location on the screens size. 
myTriangle = display.newPolygon(175, 200, triangleV)
-- draw the triangle's location on the screens size. 
myTrapezoid = display.newPolygon(525, 200, trapezoidV)
-- draw the triangle's location on the screens size. 
myPentagon = display.newPolygon(830, 200, pentagonV)
-- draw the triangle's location on the screens size. 
myHexagon = display.newPolygon(200, 525, hexagonV)
-- draw the triangle's location on the screens size. 
myOctagon = display.newPolygon(560, 525, octagonV)
-- draw the triangle's location on the screens size. 
myQuadrilateral = display.newPolygon(850, 525, quadrilateralV)

-- set the backround colour of my screen. 
-- Remember that colours are between 0 and 1
display.setDefault("background", 204/255, 255/255, 229/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the width of the border for the shapes
myTriangle.strokeWidth = 20
myTrapezoid.strokeWidth = 20
myPentagon.strokeWidth = 20
myHexagon.strokeWidth = 20
myOctagon.strokeWidth = 20
myQuadrilateral.strokeWidth = 20

-- set the colour of the shapes
myTriangle:setFillColor(204/255, 255/255, 255/255)
myTrapezoid:setFillColor(204/255, 255/255, 204/255)
myPentagon:setFillColor(255/255, 229/255, 204/255)
myHexagon:setFillColor(255/255, 204/255, 204/255)
myOctagon:setFillColor(255/255, 255/255, 204/255)
myQuadrilateral:setFillColor(255/255, 204/255, 255/255)

-- set the color of the border of the shapes
myTriangle:setStrokeColor(204/255, 204/255, 255/255)
myTrapezoid:setStrokeColor(204/255, 204/255, 255/255)
myPentagon:setStrokeColor(204/255, 204/255, 255/255)
myHexagon:setStrokeColor(204/255, 204/255, 255/255)
myOctagon:setStrokeColor(204/255, 204/255, 255/255)
myQuadrilateral:setStrokeColor(204/255, 204/255, 255/255)


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











