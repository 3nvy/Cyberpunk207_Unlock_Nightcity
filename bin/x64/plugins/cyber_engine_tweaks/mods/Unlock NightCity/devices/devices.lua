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

function turnOffComputer(devicePS)
	if not devicePS:IsInSleepMode() then
		ps:QueuePSDeviceEvent(devicePS:ActionToggleON())
		devicePS:SetIsInSleepMode(true)
	end

	if devicePS:IsON() then
		ps:QueuePSDeviceEvent(devicePS:ActionToggleON())
		devicePS:SetIsInSleepMode(true)
	end
end


function DeviceManager.CheckDevice(object)

	if object:ToString() == "LiftDevice" then
		
		unlockLiftDevice(object)
		return true

	elseif object:ToString() == "ElevatorFloorTerminal" then

		unlockElevatorTerminal(object)
		return true

	elseif object:ToString() == "Computer" then

		turnOffComputer(object:GetDevicePS())
		return true
	
	end

end

return DeviceManager