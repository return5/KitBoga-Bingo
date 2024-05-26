local Tile = require('model.Tile')
local setmetatable = setmetatable

local Tiles = {}
Tiles.__index = Tiles

_ENV = Tiles

function Tiles:getX(i)
	return self.tiles[i].x
end

function Tiles:getY(i)
	return self.tiles[i].y
end

function Tiles:addNewTile(x,y,text)
	self.tiles[#self.tiles + 1] = Tile:new(text,self.height,self.width,x,y,self.limit,self.paddingX,self.paddingY)
end

function Tiles:print()
	for i=1,#self.tiles,1 do
		self.tiles[i]:print()
	end
end

function Tiles:new(tileHeight,tileWidth,textLimit,paddingX,paddingY)
	return setmetatable({height = tileHeight,width = tileWidth,tiles = {},limit = textLimit,paddingX = paddingX,paddingY = paddingY},self)
end

return Tiles
