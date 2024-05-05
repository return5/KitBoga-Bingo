local Coord = require('model.coord')
local setmetatable = setmetatable
local printf = love.graphics.printf

local TextCoord = {}
TextCoord.__index = TextCoord

_ENV = TextCoord

function TextCoord:print()
	--TODO
end

function TextCoord:new(x,y,text)
	local o = setmetatable(Coord:new(x,y),self)
	o.text = text
	return o
end

return TextCoord
