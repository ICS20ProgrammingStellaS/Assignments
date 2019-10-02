-- Title: DrawingShapes
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays multiple shapes

-- create my local variables
local textSize = 50
local myTriangle
local trianlgeText
local areaTextObject
local areaOfTriangle = baseOfTriangle*heightOfTriangle/2
local baseOfTriangle = 8
local heightOfTriangle = 6
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
local quadrilateralV = {-120, -60, -120, -120, 60, -60, 60, 60}

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

-- creat text object, set its position and add color of text
local textObject = display.newText ("Triangle", 175, 350, nil, 50)
textObject:setTextColor (0,0,0)
local textObject = display.newText ("Trapezoid", 530, 350, nil, 50)
textObject:setTextColor (0,0,0)
local textObject = display.newText ("Pentagon", 835, 350, nil, 50)
textObject:setTextColor (0,0,0)
local textObject = display.newText ("Hexagon", 200, 650, nil, 50)
textObject:setTextColor (0,0,0)
local textObject = display.newText ("Octagon", 565, 650, nil, 50)
textObject:setTextColor (0,0,0)
local textObject = display.newText ("Quadrilateral", 875, 650, nil, 50)
textObject:setTextColor (0,0,0)

local areaTextObject = display.newText ("The area of the triangle is ... ", 175, 350, nil, 50)
textObject:setTextColor (0,0,0)

-- write the area of the circle on the screen. Take into consideration the size of
-- the font when positioning it on the screen.
areaTextCircle = display.newText("The area of this circle with a radius of \n"..
	radiusOfCircle .. " is " ..
	areaOfCircle .. " pixels². ", 0, 50, Arial, textSize)