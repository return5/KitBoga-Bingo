
local write = io.write
local setmetatable = setmetatable

local Board = {}
Board.__index = Board

_ENV = Board

function Board:print()
	for i=1,5,1 do
		for j=1,4,1 do
			write(self.board[i][j],"::")
		end
		write(self.board[i][5],"\n")
	end
end

function Board:new()
	return setmetatable({board = {{},{},{},{},{}}},self)
end


return Board
