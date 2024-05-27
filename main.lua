local GridText = require("model.GridText")
local TilesFactory = require('factory.TilesFactory')
local CanvasFactory = require('factory.CanvasFactory')
local ClickableFactory = require('factory.ClickableFactory')
local defaultFont = love.graphics.getFont()
local bingoFont = love.graphics.newFont(40)
local gotBingo = false
local bingoTextHeightMiddle = math.floor(bingoFont:getHeight("a") / 2)

local function initBoard()
	love.graphics.setFont(defaultFont)
	local startY = 100
	local lineWidth = 1
	local tiles = TilesFactory.generateTiles(100,100,GridText.getRandomTextArray(),lineWidth + 1,startY + lineWidth,lineWidth)
	local bottomTile = tiles:getLastTile()
	local height = bottomTile.y_height + lineWidth
	local width = bottomTile.x_width + lineWidth
	love.window.setMode(width,height)
	local clickable = ClickableFactory.createClickable(tiles)
	local canvases = {
		CanvasFactory.createTextCanvas(tiles),
		CanvasFactory.createLinesCanvas(tiles, startY, lineWidth),
		CanvasFactory.createTitle("KitBoga Bingo", 1, 1, startY + lineWidth, width)
	}
	gotBingo = false
	local middleX = tiles.tiles[3][3].x + math.floor(tiles.tiles[3][3].width / 2)
	local middleY = tiles.tiles[3][3].y  + math.floor(tiles.tiles[3][3].height / 2)
	return clickable,canvases,middleX,middleY
end

local clickable,canvases,middleX,middleY = initBoard()

local function bingo()
	local text = "You Got Bingo!"
	love.graphics.setFont(bingoFont)
	local middleText = math.floor(bingoFont:getWidth(text) / 2)
	love.graphics.print(text,middleX - middleText,middleY - bingoTextHeightMiddle)
	love.graphics.setFont(defaultFont)
end

function love.draw()
	for i=1,#canvases,1 do
		love.graphics.draw(canvases[i])
	end
	clickable:print()
	if gotBingo then
		bingo()
	end
end

function love.mousepressed(x,y,button)
	gotBingo = button == 1 and clickable:clicked(x,y)
end

function love.keypressed(key)
	if key == "r" then
		clickable,canvases,middleX,middleY = initBoard()
	end
end

function love.update(dt)

end
