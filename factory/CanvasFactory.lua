local setCanvas = love.graphics.setCanvas
local newCanvas = love.graphics.newCanvas
local line = love.graphics.line


local CanvasFactory = {}
CanvasFactory.__index = CanvasFactory

_ENV = CanvasFactory

function CanvasFactory.createLinesCanvas(tiles,startY,height,width,lineWidth)
	local canvas = newCanvas(height - startY,width)
	setCanvas(canvas)
	for i=1,4,1 do
		local x = tiles:getX(i) - lineWidth
		line(x,startY,x,height)
	end
	for i=1,11,5 do
		local y = tiles:getY(i) - lineWidth
		line(1,y,width,y)
	end
	setCanvas()
	return canvas
end

function CanvasFactory.createTextCanvas(tiles,startY)
	local canvas = newCanvas(tiles.tiles[#tiles.tiles].y_height - startY,tiles.tiles[#tiles.tiles].x_width)
	setCanvas(canvas)
	tiles:print()
	setCanvas()
	return canvas
end


return CanvasFactory
