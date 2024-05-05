local TextBoard = require('model.TextBoard')
local setCanvas = love.graphics.setCanvas
local newCanvas = love.graphics.newCanvas
local draw = loves.graphics.draw
local setLineWidth = love.graphics.setLineWidth
local line  = love.graphics.line
local setColor = love.graphics.setColor


local CanvasFactory = {}
CanvasFactory.__index = CanvasFactory

_ENV = CanvasFactory



function CanvasFactory.createTextCanvas(text,tile,startY,height,width)
	local textBoard = TextBoard:new(text,tile)
	local canvas = newCanvas(height - startY,width)
	setCanvas(canvas)
	for _, textCoord in textBoard:iterate() do
		textCoord:print()
	end
	setCanvas()
	return canvas
end


return CanvasFactory
