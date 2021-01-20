-- Change Slot Cooldown Time Here (in minutes)
slotCoolDownTime = 1440

-- Change Smuggling Cost
smugglingCost = 50000


-- Mod Code
packages = {}
rootPath = "bin.x64.plugins.cyber_engine_tweaks.mods.Unlock NightCity."



function loadPackages()
	packages.ItemsManager = require(rootPath .. "misc.items")
	packages.TeleportManager = require(rootPath .. "teleports.teleports")
	packages.DoorManager = require(rootPath .. "doors.doors")
	packages.DeviceManager = require(rootPath .. "devices.devices")
	packages.SlotMachineManager = require(rootPath .. "slotmachine.slotmachine")
	packages.SmugglerManager = require(rootPath .. "smuggler.smuggler")
end

-- print(Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false):GetWorldPosition())
-- Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false):GetDevicePS():ActionNextStation()
registerForEvent("onInit", function()
	loadPackages()

	tt = Game.GetTargetingSystem()

	print("[Unlock NightCity] Initialized | Version: 1.4.1")
end)

registerForEvent("onUpdate", function()
	
	local stopAfter = false

	packages.SmugglerManager.UpdateSmugglerWindow()

	if (ImGui.IsKeyPressed(0x25, false)) then
		local object = tt:GetLookAtObject(Game.GetPlayer(), false, false)
		packages.DeviceManager.SwitchPreviousTVChannel(object)
	end
	
	if (ImGui.IsKeyPressed(0x27, false)) then
		local object = tt:GetLookAtObject(Game.GetPlayer(), false, false)
		packages.DeviceManager.SwitchPreviousTVChannel(object)
	end

	if (ImGui.IsKeyDown(0x10) and ImGui.IsKeyPressed(0x46, false)) then
		local object = tt:GetLookAtObject(Game.GetPlayer(), false, false)
		packages.DeviceManager.TurnOffComputer(object)
	end


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


		-- Check for Smuggler
		stopAfter = packages.SmugglerManager.CheckSmuggler(object, smugglingCost)
		if stopAfter then return end

	end

end)

registerForEvent("onDraw", function()
	ImGui.PushStyleColor(ImGuiCol.PopupBg, 0.21, 0.08, 0.08, 0.85)
	ImGui.PushStyleColor(ImGuiCol.Border, 0.4, 0.17, 0.12, 1)
	ImGui.PushStyleColor(ImGuiCol.Separator, 0.4, 0.17, 0.12, 1)
	
	if (drawSmuggleWindow) then
		ImGui.BeginTooltip()
		ImGui.SetWindowFontScale(1.6)
		ImGui.Spacing()
			ImGui.TextColored(0.45, 1, 0.5, 1, "[Warning] Getting out of the Watson District during Lockdown may break some quests.")
			ImGui.Spacing()
			ImGui.Separator()
			ImGui.Spacing()
			ImGui.TextColored(0.2, 1, 1, 1, "Sure, I can smuggle you out of the Watson District, but it will cost you.")
			ImGui.Spacing()
			ImGui.TextColored(0.2, 1, 1, 1, "Say, 50.000 eddies? I need it to be worth the risk for me!")
			ImGui.Spacing()
			ImGui.Separator()
			ImGui.Spacing()
			ImGui.TextColored(0.98, 0.85, 0.25, 1, "[F] Sure, just get me out of here already")
			ImGui.Spacing()
			ImGui.Spacing()
			ImGui.TextColored(0.98, 0.85, 0.25, 1, "[Look Away] Nah, maybe another time.")
			ImGui.Spacing()
		ImGui.EndTooltip()
	end

	ImGui.PopStyleColor(3)
end)