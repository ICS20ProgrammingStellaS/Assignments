-- Title: DrawingShapes
-- Name: Stella Armstrong
-- Course: ICS2O
-- This program displays multiple shapes

-- create my local variables
local textSize = 25
local myTriangle
local trianlgeText
local areaTextTriangle
local areaOfTriangle 
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

-- create local variables for the positioning of each shape.
local triangleV = {135, 90, -135, 90, 0, -90}
local trapezoidV = {-60, -90, 60, -90, 120, 60, -120, 60}
local pentagonV = {-120, -30, 0, -90, 120, -30, 60, 60, -60, 60}
local hexagonV = {-120, 0, -80, -80, 80, -80, 120, 0, 80, 80, -80, 80}
local octagonV = {-120, 0, -120, -60, -60, -120, 60, -120, 120, -60, 120, 0, 60, 60, -60, 60}
local quadrilateralV = {-120, -60, -120, -120, 60, -60, 60, 60}

-- draw each shape's location on the screens size. 
myTriangle = display.newPolygon(175, 200, triangleV) 
myTrapezoid = display.newPolygon(525, 200, trapezoidV)
myPentagon = display.newPolygon(830, 200, pentagonV)
myHexagon = display.newPolygon(200, 525, hexagonV)
myOctagon = display.newPolygon(560, 525, octagonV) 
myQuadrilateral = display.newPolygon(850, 525, quadrilateralV)

-- set the backround colour of my screen. 
-- Remember that colours are between 0 and 1
display.setDefault("background", 204/255, 255/255, 229/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the width of the border for each shape.
myTriangle.strokeWidth = 20
myTrapezoid.strokeWidth = 20
myPentagon.strokeWidth = 20
myHexagon.strokeWidth = 20
myOctagon.strokeWidth = 20
myQuadrilateral.strokeWidth = 20

-- set the colour of each shape.
myTriangle:setFillColor(204/255, 255/255, 255/255)
myTrapezoid:setFillColor(204/255, 255/255, 204/255)
myPentagon:setFillColor(255/255, 229/255, 204/255)
myHexagon:setFillColor(255/255, 204/255, 204/255)
myOctagon:setFillColor(255/255, 255/255, 204/255)
myQuadrilateral:setFillColor(255/255, 204/255, 255/255)

-- set the color of the border of each shape.
myTriangle:setStrokeColor(204/255, 204/255, 255/255)
myTrapezoid:setStrokeColor(204/255, 204/255, 255/255)
myPentagon:setStrokeColor(204/255, 204/255, 255/255)
myHexagon:setStrokeColor(204/255, 204/255, 255/255)
myOctagon:setStrokeColor(204/255, 204/255, 255/255)
myQuadrilateral:setStrokeColor(204/255, 204/255, 255/255)

-- creat text object, set its position and add the color of the text.
local textObject = display.newText ("Triangle", 175, 350, nil, 50)
textObject:setTextColor (51/255, 153/255, 255/255)
local textObject = display.newText ("Trapezoid", 530, 350, nil, 50)
textObject:setTextColor (0,204/255, 102/255)
local textObject = display.newText ("Pentagon", 835, 350, nil, 50)
textObject:setTextColor (255/255, 178/255, 102/255)
local textObject = display.newText ("Hexagon", 200, 650, nil, 50)
textObject:setTextColor (255/255, 102/255, 102/255)
local textObject = display.newText ("Octagon", 565, 650, nil, 50)
textObject:setTextColor (255/255, 255/255, 102/255)
local textObject = display.newText ("Quadrilateral", 875, 650, nil, 50)
textObject:setTextColor (0,0,0)

-- calculate the area of the rectangle
areaOfTriangle = baseOfTriangle * heightOfTriangle/2

-- write the area of the triangle on the screen. Take into consideration the size of
-- the font when positioning it on the screen.
areaTextTriangle = display.newText("The area of this triangle with a base of \n"..
	baseOfTriangle .. " and a height of " .. heightOfTriangle .. " is " ..
	areaOfTriangle .. " pixels². ", 250, 50, Arial, textSize)
areaTextTriangle:setTextColor (0, 0, 0)