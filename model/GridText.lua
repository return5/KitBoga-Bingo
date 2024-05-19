local rand = math.random

local GridText = {}
GridText.__index = GridText

_ENV = GridText

local text = {
	"Remote Desktop Application","Windows key + R","Open Your Chrome","Kit Redeems Card","Google Play Card", "Target Gift Card",
	"Kit Talks Over Scammer","Merged Call","NetStat","Edna Uses Modern Slang","Swears In English",'Swears in "Spanish"',
	"You Are Like My Grand Mother/Father","Kit Hangs Up On Scammer","Kit Pretends To Be A Scammer", "Are You Stupid?",
	"Are You Mad?","Scammer Pretends To Be Someone Famous","Construct Additional Pylons","Phone Glitch", "Scammer Hangs Up",
	"Kit Laughs","Logs Into Fake Bank Account","Secure Banking Server","Each And Everything","Female Scammer", "Wire Transfer",
	"Travel To Bank","Bitcoin","Scammer Threatens To Call Police","You Will Lose Your Money","Works For Microsoft", "Works For GeekSquad",
	"Works For Bank Of America","Scammer Sings Song","Kit Plays Recorded Audio","Kit In Kitchen", "Kit Not Wearing Sunglasses",
	"I Will Lose My Job","Truck","Hackers","Scammer Has Bad Audio","Secure Phone Line","Transfer Funds Between Accounts",
	"Zelle","Shut Up","Porn Hub","Another Scammer Talking In Background","I Cup","Behind The Bars"
}

local function randomizeText()
	for i=#text,1,-1 do
		local randI = rand(1,i)
		local temp = text[randI]
		text[randI] = text[i]
		text[i] = temp
	end
end

local function returnNextText()
	local i = 0
	return function()
		i = i + 1
		return text[i]
	end
end

local function addToArray(start,stop,arr,getNextText)
	for i=start,stop,1 do
		arr[#arr + 1] = getNextText()
	end
end

function GridText.getRandomTextArray()
	randomizeText()
	local newArr = {}
	local getNextText = returnNextText()
	addToArray(1,12,newArr,getNextText)
	newArr[#newArr + 1] = "Free Space"
	addToArray(1,12,newArr,getNextText)
	return newArr
end

return GridText
