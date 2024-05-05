local setmetatable = setmetatable

local Line = {}
Line.__index = Line

_ENV = Line

function Line:new(startCoord,stopCoord)
	return setmetatable({start = startCoord,stop = stopCoord},self)
end

return Line
