local XMark = require('model.XMark')
local pairs = pairs
local setColor = love.graphics.setColor
local setLineWidth = love.graphics.setLineWidth
local defaultR,defaultG,defaultB = love.graphics.getColor()
local defaultLineWidth = love.graphics.getLineWidth()

local setmetatable = setmetatable

local Clickable = {}
Clickable.__index = Clickable

_ENV = Clickable

function Clickable:clicked(x,y)
	local clickedTile = self.textTiles:clicked(x,y)
	if clickedTile then
		if self.clickedTiles[clickedTile] then
			self.clickedTiles[clickedTile] = nil
		else
			self.clickedTiles[clickedTile] = XMark:new(self.textTiles:getTile(clickedTile))
		end
	end
end

function Clickable:print()
	setColor(1,0,0)
	setLineWidth(defaultLineWidth + 3)
	for _,v in pairs(self.clickedTiles) do
		v:print()
	end
	setColor(defaultR,defaultG,defaultB)
	setLineWidth(defaultLineWidth)
end

function Clickable:new(textTiles)
	return setmetatable({textTiles = textTiles,clickedTiles = {}},self)
end

return Clickable
