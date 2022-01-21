-- MADE BY AGUZ5980YOU
-- ADJUST ALL YOU WANT

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local args = {
    [1] = "a",
    [2] = "All"
}

getgenv().Spamming = false
getgenv().SpamDuration = 1.5
getgenv().SpamWord = "Society and its Future"

------------------------------------------------------------------

function spam()
	spawn(function()
		while getgenv().Spamming do
			args[1] = getgenv().SpamWord
			game:service"ReplicatedStorage".DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
			wait(getgenv().SpamDuration)
		end
	end)
end

function sendMssg(tab)
	local mssgArgs = tab or {Title = "NIL", Text = "NIL"}
	game:service"StarterGui":SetCore("SendNotification", mssgArgs)
end

sendMssg({Title = "Script Loaded!", Text = "This script was made by aguz5980you, if theres any bugs please report it to me."})

---------------------------------------------------------------------

local Window = Library.CreateLib("SPAM", "Ocean")
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main")

local CreditsTab = Window:NewTab("Credits")
local CreditsSection = CreditsTab:NewSection("Script made by aguz5980you\nUsed with Kavo UI")

MainSection:NewToggle("Spam", "Spams non stop until you toggle it off", function(v)
	getgenv().Spamming = v
	
	if v == true then
		spam()
	end
end)

MainSection:NewTextBox("Spam Duration", "Spams every second default is "..getgenv().SpamDuration, function (v)
	if tonumber(v) then
		getgenv().SpamDuration = v
		sendMssg({Title = "Success!", Text = "Succesfully changed the spam duration to "..v})
	else
		sendMssg({Title = "Error", Text = "You need to put a number not a string"})
	end
end)

MainSection:NewTextBox("Spam Text", "Spams the word you are gonna say", function (v)
	getgenv().SpamWord = v
	sendMssg({Title = "Success!", Text = "That letter you are gonna spam when toggled is "..v})
end)