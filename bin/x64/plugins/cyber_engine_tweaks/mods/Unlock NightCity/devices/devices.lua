local DialogUI = require("lib/interactionUI")
local Utils = require("lib/utils")

local DeviceManager = {}

local ps = Game.GetPersistencySystem()

function unlockingLiftPanel(devicePS)
	for i = 0, #devicePS:GetFloors() do
		local actionShowFloor = devicePS:ActionQuestShowFloor()
		local actionActiveFloor = devicePS:ActionQuestSetFloorActive()
		actionShowFloor:SetProperties(i)
		actionActiveFloor:SetProperties(i)
		ps:QueuePSDeviceEvent(actionShowFloor)
		ps:QueuePSDeviceEvent(actionActiveFloor)
	end

	devicePS:ForceEnableDevice()
	devicePS:ForceDeviceON()
	devicePS:WakeUpDevice()
end

function unlockLiftDevice(object)
	object:ActivateDevice()
	object:TurnOnDevice()
	object:StartUsing()
	object:RestorePower()
	object:TurnAuthorizationModuleOFF()
	object:GetDevicePS():SetDeviceState(1)

	unlockingLiftPanel(object:GetDevicePS())

	print('[Unlock NightCity] Lift Device Unlocked')
end

function unlockElevatorTerminal(object)
	local liftControllerPS = nil
	local parents = object:GetDevicePS():GetImmediateParents()

	for _, v in ipairs(parents) do
		if v:ToString() == "LiftControllerPS" then
			liftControllerPS = v
		end
	end

	if not liftControllerPS then
		print("Failed to find LiftControllerPS!")
		return
	end

	unlockingLiftPanel(liftControllerPS)

	print('[Unlock NightCity] Elevator Terminal Unlocked')
end

function toogleComputerState(devicePS)
	ps:QueuePSDeviceEvent(devicePS:ActionToggleON())
	devicePS:SetIsInSleepMode(true)
end

function DeviceManager.ToogleComputerState(object)
	if object and object:ToString() == "Computer" then
		toogleComputerState(object:GetDevicePS())
	end
end

function DeviceManager.CheckDevice(object)

	if object:ToString() == "LiftDevice" then

		unlockLiftDevice(object)
		return true

	elseif object:ToString() == "ElevatorFloorTerminal" then

		unlockElevatorTerminal(object)
		return true

	elseif object:ToString() == "TV" then

		local entityID = object:GetEntityID();

		if not DialogUI.entityID or DialogUI.entityID ~= entityID.hash then

			DialogUI.Cleanup()

			if Utils.HasNoDireactLayer(object) and Utils.InRange(object:GetWorldPosition()) then
				Utils.CreateTVDialog(object)
				DialogUI.entityID = entityID.hash
				DialogUI.showHub()
			end

		elseif DialogUI.entityID and DialogUI.entityID == entityID.hash and not Utils.InRange(object:GetWorldPosition()) then
			DialogUI.Cleanup()
		end

	end

end

function DeviceManager.Log()
	print('[Unlock NightCity] DeviceManager Loaded')
end

return DeviceManager
