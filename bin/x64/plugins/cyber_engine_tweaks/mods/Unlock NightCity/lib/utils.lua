local DialogUI = require("lib/interactionUI")

local Utils = {}

function Utils.HasNoDireactLayer(object)
    local _, activeLayers = object.interaction:GetActiveInputLayers()
    return #activeLayers == 0
end

function Utils.InRange(objPosition, range)
    range = range or 3
    return GetPlayer():GetWorldPosition():Distance(objPosition) <= range
end

function Utils.GetIcon(path)
    return TweakDBInterface.GetChoiceCaptionIconPartRecord(path)
end

function Utils.SetupChoice(choicesArr, choice, callback)
    table.insert(choicesArr, choice)
    DialogUI.callbacks[#choicesArr] = callback
end

function Utils.CreateTVDialog(object)
    local choices = {}
    local isOn = object:GetDevicePS():IsON()

    local choiceOnOff = DialogUI.createChoice(isOn and 'Turn Off' or 'Turn On', Utils.GetIcon("ChoiceCaptionParts.OnOff")
        ,
        gameinteractionsChoiceType.QuestImportant)

    Utils.SetupChoice(choices, choiceOnOff, function()
        Game.GetPersistencySystem():QueuePSDeviceEvent(object:GetDevicePS():ActionToggleON())
        DialogUI.Cleanup()
        DialogUI.clearCallbacks()
        DialogUI.CreateTVDialog(object)
        DialogUI.showHub()
    end)

    if isOn then
        local choiceNext = DialogUI.createChoice('Next Station', Utils.GetIcon("ChoiceCaptionParts.UseIcon"))
        Utils.SetupChoice(choices, choiceNext, function()
            Game.GetPersistencySystem():QueuePSDeviceEvent(object:GetDevicePS():ActionNextStation())
            DialogUI.CreateTVDialog(object)
            print('Next STation')
        end)

        local choicePrev = DialogUI.createChoice('Previous Station', Utils.GetIcon("ChoiceCaptionParts.UseIcon"))
        Utils.SetupChoice(choices, choicePrev, function()
            Game.GetPersistencySystem():QueuePSDeviceEvent(object:GetDevicePS():ActionPreviousStation())
            DialogUI.CreateTVDialog(object)
            print('Next STation')
        end)
    end

    DialogUI.setupHub(DialogUI.createHub('TV', choices))
end

return Utils
