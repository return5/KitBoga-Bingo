local GridText = require("model.GridText")
local TilesFactory = require('factory.TilesFactory')
local CanvasFactory = require('factory.CanvasFactory')

local startY = 100
local height = 600
local width = 500
local lineWidth = 1
local textArr = GridText.getRandomTextArray()
local tiles = TilesFactory.generateTiles(100,100,textArr,lineWidth + 1,startY + lineWidth,lineWidth)
local canvases = {
	CanvasFactory.createTextCanvas(tiles,startY,height,width),
	CanvasFactory.createLinesCanvas(tiles,startY,height,width,lineWidth),
	CanvasFactory.createTitle("KitBoga Bingo",1,1,startY + 100,width)
}

function love.draw()
	for i=1,#canvases,1 do
		love.graphics.draw(canvases[i])
	end
end


function love.update(dt)

end

function love.load()
end
