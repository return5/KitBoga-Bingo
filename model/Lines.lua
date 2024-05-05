local Coord = require("model.coord")
local Line = require("model.Line")

local setmetatable = setmetatable

local Lines = {}
Lines.__index = Lines

_ENV = Lines

function Lines:addVertical(coord)
	if not self.columns[coord.x] then
		local startCoord = self.board.indexToCoord(self.board,coord.x,0)
		local stopCoord = self.board.indexToCoord(self.board,coord.x,5)
		self.columns[coord.x] = Line:new(startCoord,stopCoord)
	end
end

function Lines:addHorizontal(coord)
	if not self.rows[coord.y] then
		local startCoord = self.board.indexToCoord(self.board,0,coord.y)
		local stopCoord = self.board.indexToCoord(self.board,0,5)
		self.rows[coord.y] = Line:new(startCoord,stopCoord)
	end
end

function Lines:removeHorizontal(x)
	self.rows[x] = nil
end

function Lines:removeVertical(y)
	self.columns[y] = nil
end

function Lines:new(board)
	return setmetatable({rows = {},columns = {},board = board},self)
end

return Lines
