local Board = require("model.Board")
local TextCoord = require('model.TextCoord')
local setmetatable = setmetatable
local floor = math.floor

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


local function generateTextCoord(vars,self)
	local text = self.board[vars.i][vars.j]
	local x = ((vars.j - 1) * self.width) + self.halfW
	local y = ((vars.i - 1) * self.height) + self.halfH
	return TextCoord:new(x,y,text)
end

local function iter(vars,self)
	vars.j = vars.j + 1
	if vars.j > 5 then
		vars.j =1
		vars.i = vars.i + 1
	end
	if self.board[vars.i] then
		return vars, generateTextCoord(vars,self)
	end
end

function TextBoard:iterate()
	return iter, self, {i=1,j=0}
end


function TextBoard:new(text,tile)
	local textBoard = setmetatable(Board:new(),self)
	textBoard.height = tile:getHeight()
	textBoard.width = tile:getWidth()
	textBoard.halfW = floor(textBoard.width / 2)
	textBoard.halfH = floor(textBoard.height / 2)
	createNewBoard(text,textBoard.board)
	return textBoard
end

return TextBoard
