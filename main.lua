local GridText = require("model.GridText")
local TilesFactory = require('factory.TilesFactory')
local CanvasFactory = require('factory.CanvasFactory')


local function generateCanvases()
	local startY = 100
	local lineWidth = 1
	local textArr = GridText.getRandomTextArray()
	local tiles = TilesFactory.generateTiles(100,100,textArr,lineWidth + 1,startY + lineWidth,lineWidth)
	local height = tiles.tiles[#tiles.tiles].y_height + lineWidth
	local width = tiles.tiles[#tiles.tiles].x_width + lineWidth
	love.window.setMode(width,height)
	return {
		CanvasFactory.createTextCanvas(tiles,startY),
		CanvasFactory.createLinesCanvas(tiles,startY,lineWidth),
		CanvasFactory.createTitle("Kit Boga Bingo",1,1,startY + lineWidth,width)
	}
end

local canvases = generateCanvases()

function love.draw()
	for i=1,#canvases,1 do
		love.graphics.draw(canvases[i])
	end
end


function love.update(dt)

end
