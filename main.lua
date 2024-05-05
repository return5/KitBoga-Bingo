local GridText = require("model.GridText")
local ClickableBoard = require('model.ClickableBoard')
local ClickedTiles = require('model.ClickedTiles')
local Lines = require('model.Lines')
local CanvasFactory = require('factory.CanvasFactory')

local tile = {getWidth = function() return 100  end, getHeight = function() return 100 end}
local startY = 100
local height = 600
local width = 500
local text = GridText.getRandomTextArray()
local clickableBoard = ClickableBoard:new(tile,100,500)
local clickedTiles = ClickedTiles:new()
local lines = Lines:new(board)
local textCanvas = CanvasFactory.createTextCanvas(text,tile,startY,height,width)

function love.draw()

end


function love.update(dt)

end

function love.load()
	math.randomseed(os.time())
end
