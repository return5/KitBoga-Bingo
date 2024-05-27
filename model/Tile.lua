local setmetatable = setmetatable
local printf = love.graphics.printf
local font = love.graphics.getFont()
local gmatch = string.gmatch
local concat = table.concat

local Tile = {}
Tile.__index = Tile

_ENV = Tile

function Tile:print()
	printf(self.text,self.textX,self.textY,self.limit)
end

function Tile:clicked(x,y)
	return x >= self.x and x <= self.x_width and y >= self.y and y < self.y_height
end

local function getLen(index,spaceIndex,textArr)
	local len = 0
	for i=spaceIndex + 1,index,1 do
		len = len + font:getWidth(textArr[i])
	end
	return len
end

local function setLastSpace(lastSpace,index,char)
	if char == " " then
		return index
	end
	return lastSpace
end

local function setCurrentLen(char,currentLen,limit,padding,index,lastSpace,textArr)
	local newCurrentLen = currentLen + font:getWidth(char)
	if newCurrentLen > limit then
		textArr[lastSpace] = "\n"
		return getLen(index,lastSpace,textArr)
	end
	return newCurrentLen
end

local function wrapText(text,limit,padding)
	local lastSpace = 0
	local currentLen = 0
	local index = 1
	local textArr = {}
	for char in gmatch(text,".") do
		textArr[#textArr + 1] = char
		lastSpace = setLastSpace(lastSpace,index,char)
		currentLen = setCurrentLen(char,currentLen,limit,padding,index,lastSpace,textArr)
		index = index + 1
	end
	return concat(textArr)
end

function Tile:new(text,height,width,x,y,textLimit,textWidthPadding,textHeightPadding,i,j)
	return setmetatable({
		text = wrapText(text,textLimit,textWidthPadding),limit = textLimit + 100,height = height,width = width,x = x, y = y,x_width = x + width, y_height = y + height,
		textX = x + textWidthPadding,textY = y + textHeightPadding,i = i, j = j
	},self)
end

return Tile
