local floor = math.floor
local Tiles = require('model.Tiles')

local TilesFactory = {}
TilesFactory.__index = TilesFactory

_ENV = TilesFactory

local function returnGetNextText(text)
	local i = 0
	return function()
		i = i + 1
		return text[i]
	end
end

local function generateRow(tiles,nextText,lineWidth,y)
	for i=1,4,1 do
		local x = tiles.tiles[#tiles.tiles].x_width + lineWidth
		tiles:addNewTile(x,y,nextText())
	end
end

local function generateColumnStartTile(tiles,x,y,nextText)
	tiles:addNewTile(x,y,nextText())
end

local function generateColumns(tiles,nextText,lineWidth,startX)
	for i=1,4,1 do
		local y = tiles.tiles[#tiles.tiles].y_height + lineWidth
		generateColumnStartTile(tiles,startX,y,nextText)
		generateRow(tiles,nextText,lineWidth,y)
	end
end

function TilesFactory.generateTiles(tileHeight,tileWidth,textArr,startX,startY,lineWidth)
	local nextText = returnGetNextText(textArr)
	local textLimit = floor(tileWidth / 2)
	local textWidthPadding = floor(tileWidth / 4)
	local textHeightPadding = floor(tileHeight / 4)
	local tiles = Tiles:new(tileHeight,tileWidth,textLimit,textWidthPadding,textHeightPadding)
	generateColumnStartTile(tiles,startX,startY,nextText)
	generateRow(tiles,nextText,lineWidth,startY)
	generateColumns(tiles,nextText,lineWidth,startX)
	return tiles
end

return TilesFactory
