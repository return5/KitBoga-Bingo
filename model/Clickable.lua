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

function Clickable:checkTopToBottom(j)
	for y = 1,5,1 do
		if not self.clickedTiles[y] or not self.clickedTiles[y][j] then return false end
	end
	return true
end

function Clickable:checkSideToSide(i)
	if not self.clickedTiles[i] then return false end
	for x = 1,5,1 do
		if not self.clickedTiles[i][x] then return false end
	end
	return true
end

function Clickable:checkDiagonal(startJ,incrJ)
	local j = startJ
	for i=1,5,1 do
		if not self.clickedTiles[i] or not self.clickedTiles[i][j] then return false end
		j = j + incrJ
	end
	return true
end

local mapIToJ = {{},{},{},{},{}}
mapIToJ[1][5] = true
mapIToJ[2][4] = true
mapIToJ[3][3] = true
mapIToJ[4][2] = true
mapIToJ[5][1] = true

function Clickable:checkCross(i,j)
	if i ~= j and not (mapIToJ[i] and mapIToJ[i][j]) then
		return false
	end
	return self:checkDiagonal(1,1) or
		self:checkDiagonal(5,-1)
end

function Clickable:checkForBingo(i,j)
	return self:checkTopToBottom(j) or
		self:checkSideToSide(i) or
	self:checkCross(i,j)
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
