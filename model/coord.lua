local setmetatable = setmetatable

local coord = {}
coord.__index = coord

_ENV = coord

function coord:new(x,y)
	return setmetatable({x = x, y = y},self)
end

return coord
