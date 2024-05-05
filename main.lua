local GridText = require("model.GridText")
local Board = require("model.Board")
local ClickableBoard = require('model.ClickableBoard')

local function generateNewBoard()
	local text = GridText.getRandomTextArray()
	return Board:new(text)
end

local board = generateNewBoard()
local clickableBoard = ClickableBoard:new(board)
local clickedTiles = ClickedTiles:new()

function love.draw()

end


function love.update(dt)

end

function love.load()
	math.randomseed(os.time())
end
