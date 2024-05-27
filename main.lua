local GridText = require("model.GridText")
local TilesFactory = require('factory.TilesFactory')
local CanvasFactory = require('factory.CanvasFactory')
local ClickableFactory = require('factory.ClickableFactory')

local function initBoard()
	local startY = 100
	local lineWidth = 1
	local tiles = TilesFactory.generateTiles(100,100,GridText.getRandomTextArray(),lineWidth + 1,startY + lineWidth,lineWidth)
	local height = tiles.tiles[#tiles.tiles].y_height + lineWidth
	local width = tiles.tiles[#tiles.tiles].x_width + lineWidth
	love.window.setMode(width,height)
	local clickable = ClickableFactory.createClickable(tiles)
	local canvases = {
		CanvasFactory.createTextCanvas(tiles),
		CanvasFactory.createLinesCanvas(tiles, startY, lineWidth),
		CanvasFactory.createTitle("Kit Boga Bingo", 1, 1, startY + lineWidth, width)
	}
	return clickable,canvases
end

local clickable,canvases = initBoard()

function love.draw()
	for i=1,#canvases,1 do
		love.graphics.draw(canvases[i])
	end
	clickable:print()
end

function love.mousepressed(x,y,button)
	if button == 1 then
		clickable:clicked(x,y)
	end
end

function love.keypressed(key)
	if key == "r" then
		clickable,canvases = initBoard()
	end
end

function love.update(dt)

end
