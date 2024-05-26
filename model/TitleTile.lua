local Tile = require('model.Tile')
local setFont = love.graphics.setFont
local defaultFont = love.graphics.getFont()
local ceil = math.ceil
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
	local textStartY = ceil((height - font:getHeight(text)) / 2) + y
	local textStartX = ceil((width - font:getWidth(text)) / 2) + x
	local tile = setmetatable(Tile:new(text,height,width,textStartX,textStartY,textLimit,textWidthPadding,textHeightPadding),self)
	tile.text = text
	tile.font = font
	setFont(defaultFont)
	return tile
end

return TitleTile
