-- Change Slot Cooldown Time Here (in minutes)
slotCoolDownTime = 1440

-- Change Smuggling Cost
smugglingCost = 50000

-- Enable Debug
enableDebug = false

-- Delta Time For Updated
deltaTime = 0

canDraw = false

local timer;


-- Mod Code
local DialogUI = require("lib/interactionUI")
local Cron = require("lib/Cron")

local packages = {
	ItemsManager = "misc/items",
	TeleportManager = "teleports/teleports",
	DoorManager = "doors/doors",
	DeviceManager = "devices/devices",
	SlotMachineManager = "slotmachine/slotmachine",
	SmugglerManager = "smuggler/smuggler",
}

function loadPackages()

	for pkgName, pkgLocation in pairs(packages) do
		packages[pkgName] = require(pkgLocation)

		if enableDebug then
			packages[pkgName].Log()
		end

	end

	canDraw = true

end

function runUpdates()
	packages.SmugglerManager.UpdateSmugglerWindow()
end

function checkForUpdates(object)

	if not object then return end

	packages.DoorManager.CheckAllowedDoor(object);
	packages.DeviceManager.CheckDevice(object);
end


registerForEvent("onInit", function()
	loadPackages()

	DialogUI.init()

	timer = Cron.Every(1, function()
		local object = Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false);
		checkForUpdates(object)
		DialogUI.Cleanup(object)
	end)

	print("[Unlock NightCity] Initialized | Version: 1.6.0")
end)

registerForEvent("onUpdate", function(dt)
	Cron.Update(dt)
	DialogUI.update()
end)

registerForEvent("onShutdown", function()
	Cron.Halt(timer)
end)
