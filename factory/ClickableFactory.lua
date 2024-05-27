local Clickable = require('model.Clickable')

local ClickableFactory = {}
ClickableFactory.__index = ClickableFactory


_ENV = ClickableFactory

function ClickableFactory.createClickable(tiles)
	return Clickable:new(tiles)
end

return ClickableFactory
