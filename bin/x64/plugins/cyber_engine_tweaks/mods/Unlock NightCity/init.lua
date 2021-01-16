-- Change Slot Cooldown Time Here (in minutes)
slotCoolDownTime = 1440


-- Mod Code
packages = {}
rootPath = "Unlock NightCity."

packages.ItemsManager = require(rootPath .. "misc.items")
packages.TeleportManager = require(rootPath .. "teleports.teleports")
packages.DoorManager = require(rootPath .. "doors.doors")
packages.DeviceManager = require(rootPath .. "devices.devices")
packages.SlotMachineManager = require(rootPath .. "slotmachine.slotmachine")


local tt = Game.GetTargetingSystem()

-- print(Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false):GetWorldPosition())

registerForEvent("onInit", function()
	print("[Unlock NightCity] Initialized | Version: 1.3.1")
end)

registerForEvent("onUpdate", function()
	
	local stopAfter = false

	if (ImGui.IsKeyPressed(0x46, false)) then -- Press F

		-- Check for Teleport location
		stopAfter = packages.TeleportManager.CheckTeleport()
		if stopAfter then return end

		-- Stop Runtime If No Object Found
		local object = tt:GetLookAtObject(Game.GetPlayer(), false, false)
		if not object then return end

		-- Check for Devices
		stopAfter = packages.DeviceManager.CheckDevice(object)
		if stopAfter then return end

		-- Check for SlotMachine
		stopAfter = packages.SlotMachineManager.CheckSlotMachine(object, slotCoolDownTime, packages.ItemsManager)
		if stopAfter then return end

		-- Check for Allowed Doors
		stopAfter = packages.DoorManager.CheckAllowedDoor(object)
		if stopAfter then return end

	end

end)
