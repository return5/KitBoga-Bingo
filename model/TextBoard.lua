local Board = require("model.Board")
local setmetatable = setmetatable

local TextBoard = {}
TextBoard.__index = TextBoard
setmetatable(TextBoard,Board)

_ENV = TextBoard

local function returnGetNextText(text)
	local i = 0
	return function()
		i = i + 1
		return text[i]
	end
end

local function generateRow(i,getNextText,board)
	for j=1,5,1 do
		board[i][j] = getNextText()
	end
end

local function createNewBoard(text,board)
	local getNextText = returnGetNextText(text)
	for i=1,5 do
		generateRow(i,getNextText,board)
	end
end

function TextBoard:new(text)
	local textBoard = setmetatable(Board:new(),self)
	createNewBoard(text,textBoard.board)
	return textBoard
end

return TextBoard
