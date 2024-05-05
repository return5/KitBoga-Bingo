local coord = require("model.coord")

local setmetatable = setmetatable
local floor = math.floor

local ClickableBoard = {}
ClickableBoard.__index = ClickableBoard

_ENV = ClickableBoard

local function isClicked(x,y)
	if y <= self.height then return false end
	return true
end

function ClickableBoard:clicked(x,y)
	local i = floor(x) % floor (self.width * 5)
	local j = floor(y) % floor(self.height * 5)
	return coord:new(i,j)
end

function ClickableBoard:new(tile,height,width)
	return setmetatable({height = height, width = width,tileHeight = tile:getHeight(),tileWidth = tile:getWidth()},self)
end

return ClickableBoard
