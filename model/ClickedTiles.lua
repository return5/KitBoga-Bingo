local Board = require('model.Board')
local setmetatable = setmetatable

local ClickedTiles = {}
ClickedTiles.__index = ClickedTiles
setmetatable(ClickedTiles,Board)

_ENV = ClickedTiles


function ClickedTiles:checkForLine(j,checkFunc)
	for i=1,5,1 do
		if not checkFunc(i,j,self.board) then return false end
		return true
	end
end

local function checkColumn(y,x,board)
	return board[y][x]
end

function ClickedTiles:checkVertical(x)
	return self:checkForLine(x,checkColumn)
end


local function checkRow(x,y,board)
	return board[y][x]
end

function ClickedTiles:checkHorizontal(y)
	return self:checkForLine(y,checkRow)
end

function ClickedTiles:checkForRows(x,y,lines,board)
	if self:checkVertical(x) then
		lines:addVertical(x,board)
	end
	if self:checkHorizontal(y) then
		lines:addHorizontal(y,board)
	end
end

function ClickedTiles:remove(coord)
	self.board[coord.y][coord.x] = false
	return self
end

function ClickedTiles:add(coord)
	self.board[coord.y][coord.x] = true
	return self
end

function ClickedTiles:clicked(coord)
	if not self.board[coord.y][coord.x] then
		return self:add(coord)
	end
	return self:remove(coord)
end

function ClickedTiles:reset()
	for i=1,5,1 do
		for j=1,5,1 do
			self.board[i][j] = false
		end
	end
end

function ClickedTiles:new()
	local board = setmetatable(Board:new(),self)
	board:reset()
end

return ClickedTiles
