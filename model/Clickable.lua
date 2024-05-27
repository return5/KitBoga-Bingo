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

function Clickable:checkTopToBottom(i,j)

end

function Clickable:checkSideToSide(i,j)

end

function Clickable:checkCross(i,j)

end

function Clickable:checkForBingo(i,j)
	self:checkTopToBottom(i,j)
	self:checkSideToSide(i,j)
end

function Clickable:clicked(x,y)
	local clickedTile = self.textTiles:clicked(x,y)
	if clickedTile then
		local i = clickedTile.i
		local j = clickedTile.j
		if self.clickedTiles[i] and self.clickedTiles[i][j] then
			self.clickedTiles[i][j] = nil
		else
			if not self.clickedTiles[i] then self.clickedTiles[i] = {} end
			self.clickedTiles[i][j] = XMark:new(clickedTile)
			return self:checkForBingo(i,j)
		end
	end
	return false
end

function Clickable:print()
	setColor(1,0,0)
	setLineWidth(defaultLineWidth + 3)
	for _,rows in pairs(self.clickedTiles) do
		for _,tile in pairs(rows) do
			tile:print()
		end
	end
	setColor(defaultR,defaultG,defaultB)
	setLineWidth(defaultLineWidth)
end

function Clickable:new(textTiles)
	return setmetatable({textTiles = textTiles,clickedTiles = {}},self)
end

return Clickable
