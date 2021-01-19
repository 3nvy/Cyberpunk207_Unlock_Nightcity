local SmugglerManager = {}


local tt = Game.GetTargetingSystem()
local ts = Game.GetTransactionSystem()
local tp = Game.GetTeleportationFacility()
local as = Game.GetActivityLogSystem()

local moneyID = ItemID.new(TweakDBID.new("Items.money"))


function SmugglerManager.UpdateSmugglerWindow()
    if drawSmuggleWindow then
        local object = tt:GetLookAtObject(Game.GetPlayer(), false, false)
        
        drawSmuggleWindow = false

        if object and object:ToString() == "NPCPuppet" and object:GetRecordID().hash == 966543935 then
            drawSmuggleWindow = true
        end
    end
end

function SmugglerManager.CheckSmuggler(object, smugglingCost)
    print("smuggle check")
    if object:ToString() == "NPCPuppet" and object:GetRecordID().hash == 966543935 then

        if drawSmuggleWindow then
            ts:RemoveItem(Game.GetPlayer(), moneyID, 50000)
            tp:Teleport(Game.GetPlayer(), ToVector4{ x = -899.2886, y = 1319.1085, z = 5.8175964, w = 1.0 } , EulerAngles.new(0,0,-45.378467559814))
            drawSmuggleWindow = false
        else
            print("reached")
            moneyQuantity = ts:GetItemQuantity(Game.GetPlayer(), moneyID)

            if moneyQuantity >= smugglingCost then 
                print("can smuggle")
                drawSmuggleWindow = true
            else
                as:AddLog("Smuggling: Not enough eddies for smuggling. You need 50.000")
            end
        end

    end

end

return SmugglerManager