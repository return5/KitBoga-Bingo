local GridText = require("model.GridText")
local TilesFactory = require('factory.TilesFactory')
local CanvasFactory = require('factory.CanvasFactory')

local startY = 100
local height = 600
local width = 500
local lineWidth = 1
local textArr = GridText.getRandomTextArray()
local tiles = TilesFactory.generateTiles(100,100,textArr,lineWidth + 1,startY + lineWidth,lineWidth)
local tileCanvas = CanvasFactory.createTextCanvas(tiles,startY,height,width)
local lineCanvas = CanvasFactory.createLinesCanvas(tiles,startY,height,width,lineWidth)
math.randomseed(os.time())

function love.draw()
	love.graphics.draw(tileCanvas)
	love.graphics.draw(lineCanvas)
end


function love.update(dt)

end

function love.load()
end
