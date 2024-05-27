local line = love.graphics.line
local setmetatable = setmetatable

local XMark = {}
XMark.__index = XMark

_ENV = XMark

function XMark:print()
	line(self.x1,self.y1,self.x2,self.y2)
	line(self.x1,self.y2,self.x2,self.y1)
end

function XMark:new(tile)
	return setmetatable({x1 = tile.x,x2=tile.x_width,y1 = tile.y,y2 = tile.y_height},self)
end

return XMark
