local Coord = require("model.coord")

local setmetatable = setmetatable
local floor = math.floor

local ClickableBoard = {}
ClickableBoard.__index = ClickableBoard

_ENV = ClickableBoard

local function isClicked(x,y)
	if y <= self.height then return false end
	return true
end

function ClickableBoard:xToCoord(x)
	if x == 0 then return 0 end
	return (x - 1) * self.tileWidth
end

function ClickableBoard:yToCoord(y)
	if y == 0 then return self.height end
	return ((y - 1) * self.tileHeight) + self.height
end

function ClickableBoard:indexToCoord(x,y)
	return Coord:new(self:xToCoord(x),self:yToCoord(y))
end

function ClickableBoard:clicked(x,y)
	local i = floor(x) % floor (self.width * 5)
	local j = floor(y) % floor(self.height * 5)
	return Coord:new(i,j)
end

function ClickableBoard:new(tile,height,width)
	return setmetatable({height = height, width = width,tileHeight = tile:getHeight(),tileWidth = tile:getWidth()},self)
end

return ClickableBoard
