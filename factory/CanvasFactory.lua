local setCanvas = love.graphics.setCanvas
local newCanvas = love.graphics.newCanvas
local line = love.graphics.line
local newFont = love.graphics.newFont
local TitleTile = require('model.TitleTile')

local CanvasFactory = {}
CanvasFactory.__index = CanvasFactory

_ENV = CanvasFactory

function CanvasFactory.createLinesCanvas(tiles,startY,lineWidth)
	local finalTile = tiles.tiles[#tiles.tiles]
	local height =  finalTile.y_height
	local width = finalTile.x_width
	local canvas = newCanvas(width + lineWidth, finalTile.y_height + lineWidth)
	setCanvas(canvas)
	line(finalTile.x_width - lineWidth,startY,finalTile.x_width - lineWidth,height)
	for i=1,5,1 do
		local x = tiles:getX(i) - lineWidth
		line(x,startY,x,height)
	end
	for i=1,25,5 do
		local y = tiles:getY(i) - lineWidth
		line(1,y,width,y)
	end
	line(1,finalTile.y_height - lineWidth,width,finalTile.y_height - lineWidth)
	setCanvas()
	return canvas
end

function CanvasFactory.createTextCanvas(tiles)
	local canvas = newCanvas(tiles.tiles[#tiles.tiles].x_width,tiles.tiles[#tiles.tiles].y_height)
	setCanvas(canvas)
	tiles:print()
	setCanvas()
	return canvas
end

function CanvasFactory.createTitle(titleText,startY,startX,height,width)
	local canvas = newCanvas(width,height)
	local font = newFont(35)
	local titleTile = TitleTile:new(titleText,height,width,startX,startY,width,0,0,font)
	setCanvas(canvas)
	titleTile:print()
	setCanvas()
	return canvas
end


return CanvasFactory
