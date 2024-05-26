local Tile = require('model.Tile')
local setFont = love.graphics.setFont
local defaultFont = love.graphics.getFont()
local printf = love.graphics.printf
local setmetatable = setmetatable

local TitleTile = {}
TitleTile.__index = TitleTile
setmetatable(TitleTile,Tile)

_ENV = TitleTile


function TitleTile:print()
	setFont(self.font)
	Tile.print(self)
	setFont(defaultFont)
end

function TitleTile:new(text,height,width,x,y,textLimit,textWidthPadding,textHeightPadding,font)
	setFont(font)
	local tile = setmetatable(Tile:new(text,height,width,x,y,textLimit,textWidthPadding,textHeightPadding),self)
	tile.font = font
	tile.limit = font:getWidth(tile.text)
	setFont(defaultFont)
	return tile
end

return TitleTile
