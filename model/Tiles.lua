local Tile = require('model.Tile')
local setmetatable = setmetatable

local Tiles = {}
Tiles.__index = Tiles

_ENV = Tiles

function Tiles:getX(i,j)
	return self.tiles[i][j].x
end

function Tiles:getY(i,j)
	return self.tiles[i][j].y
end

function Tiles:addNewTile(i,j,x,y,text)
	if not self.tiles[i] then self.tiles[i] = {} end
	self.tiles[i][j] = Tile:new(text,self.height,self.width,x,y,self.limit,self.paddingX,self.paddingY,i,j)
end

function Tiles:print()
	for i=1,#self.tiles,1 do
		for j=1,#self.tiles[i],1 do
			self.tiles[i][j]:print()
		end
	end
end

function Tiles:getTile(i,j)
	return self.tiles[i][j]
end

function Tiles:clicked(x,y)
	for i=1,#self.tiles,1 do
		for j=1,#self.tiles[i],1 do
			if self.tiles[i][j]:clicked(x,y) then return self.tiles[i][j] end
		end
	end
	return false
end

function Tiles:getLastTile()
	local row = self.tiles[#self.tiles]
	return row[#row]
end

function Tiles:new(tileHeight,tileWidth,textLimit,paddingX,paddingY)
	return setmetatable({height = tileHeight,width = tileWidth,tiles = {},limit = textLimit,paddingX = paddingX,paddingY = paddingY},self)
end

return Tiles
