-- Change Slot Cooldown Time Here (in minutes)
slotCoolDownTime = 1440


-- Mod Code
packages = {}
rootPath = "Unlock NightCity."

packages.ItemsManager = require(rootPath .. "misc.items")

local ss = Game.GetStatsSystem()
local ps = Game.GetPersistencySystem()
local tt = Game.GetTargetingSystem()
local lm = Game.GetLootManager()
local ts = Game.GetTransactionSystem()
local tp = Game.GetTeleportationFacility()
local qs = Game.GetQuestsSystem()
local tsm = Game.GetTimeSystem()

isCoolingDown = false
lastTimeUsedSlot = 0
showSlotWindow = false
windowOpenTime = 0

function enableTooltip()
	windowOpenTime = os:clock()
	showSlotWindow = true
end

function drawSlotWindow()
	ImGui.BeginTooltip()
		ImGui.SetWindowFontScale(1.6)
		ImGui.Spacing()
		if isCoolingDown then
			ImGui.TextColored(0.2, 1, 1, 1, "Slot Still In Cooldown")
		else
			ImGui.TextColored(0.2, 1, 1, 1, "ITEM GENERATED!")
		end
		
		ImGui.Spacing()
	ImGui.EndTooltip()
end

function unlockingLiftPanel(devicePS)
	for i = 0, #devicePS:GetFloors() do
		local actionShowFloor = devicePS:ActionQuestShowFloor()
		local actionActiveFloor = devicePS:ActionQuestSetFloorActive()
		actionShowFloor:SetProperties(i)
		actionActiveFloor:SetProperties(i)
		Game.GetPersistencySystem():QueuePSDeviceEvent(actionShowFloor)
		Game.GetPersistencySystem():QueuePSDeviceEvent(actionActiveFloor)
	end

	devicePS:ForceEnableDevice()
	devicePS:ForceDeviceON()
	devicePS:WakeUpDevice()
end

function unlockElevatorTerminal(object)
	print('[Unlock NightCity] Unlocking Elevator Terminal')
	local liftControllerPS = nil
	local parents = object:GetDevicePS():GetImmediateParents()

	for _, v in ipairs(parents) do
		if string.sub(GameDump(v), 0, 17) == "LiftControllerPS[" then
			liftControllerPS = v
		end
	end

	if not liftControllerPS then
		print("Failed to find LiftControllerPS!")
		return
	end

	unlockingLiftPanel(liftControllerPS)

	print("debug: elevator unloked")
end

function unlockLiftDevice(object)
	print('[Unlock NightCity] Unlocking Lift Device')
	object:ActivateDevice()
	object:TurnOnDevice()
	object:StartUsing()
	object:RestorePower()
	object:TurnAuthorizationModuleOFF()
	object:GetDevicePS():SetDeviceState(1)
	
	unlockingLiftPanel(object:GetDevicePS())
end

function unlockDoor(object)
	print('[Unlock NightCity] Unlocking Door')
	objDPS = object:GetDevicePS();

	-- Unseal door if sealed
	if(objDPS:IsSealed()) then
		objDPS:ToggleSealOnDoor() 
	end

	-- Unlock door if locked
	if(objDPS:IsLocked()) then
		objDPS:ToggleLockOnDoor() 
	end

	objDPS:SetDeviceState(1) -- Restore power to door
	object:OpenDoor() -- Opens door
	objDPS:SetCloseItself(true) -- Closes door automatically
end

function unlockFakeDoor(object) 
	print('[Unlock NightCity] Disposing of FakeDoor')
	object:Dispose()
end

function round(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function generateRandomQuality(itemData, isSpecial)
	local newQuality = math.random (3, 4);

	local statObj = itemData:GetStatsObjectID() -- Get Item Stats Obj

	local itemQuality = ss:GetStatValue(statObj, 'Quality')
	
	ss:RemoveAllModifiers(statObj, 'Quality', true)
	
	local qualityMod = Game['gameRPGManager::CreateStatModifier;gamedataStatTypegameStatModifierTypeFloat']('Quality', 'Additive', newQuality)
	
	ss:AddSavedModifier(statObj, qualityMod);
end

function generateRandomItem()
	local itemTypes = { "Weapons", "Clothes" }
	local randomTypeGeneration = math.random(1, 2)

	local itemID = nil

	if itemTypes[randomTypeGeneration] == "Weapons" then
		local listOfWeapons = packages.ItemsManager.Weapons()
		itemID = listOfWeapons[math.random (1, #listOfWeapons)]
	else
		local listOfClothes = packages.ItemsManager.Clothes()
		itemID = listOfClothes[math.random (1, #listOfClothes)]
	end

	local tdbid = TweakDBID.new(itemID)
	local item = ItemID.new(tdbid, math.random (100, 9999999999))
	return item
end

function getNextSlotUsableTime()
	local currentGameTime = tsm:GetGameTime()
	local coolDownDays = math.floor(slotCoolDownTime/1440)
	local days = currentGameTime:Days(currentGameTime) + coolDownDays
	local hours = currentGameTime:Hours(currentGameTime) + math.floor((slotCoolDownTime-(coolDownDays*1440))/60)
	local minutes = currentGameTime:Minutes(currentGameTime) + math.floor((slotCoolDownTime%60)+0.5)
	local seconds = currentGameTime:Seconds(currentGameTime)

	local newGameTime = currentGameTime:MakeGameTime(days, hours, minutes, seconds)

	return newGameTime:GetSeconds(newGameTime)
end


local allowedDoors = {
	-- Konpeki Tower
	konpekiTowerFrontDoor = { x = -2262, y = 1705, z = nil, type = 'Door' },
	konpekiTowerSuiteShaft = { x = -2228, y = 1769, z = nil, type = 'FakeDoor' },
	konpekiTowerParkingGarangeDoor = { x = -2208, y = 1710, z = 7, type = 'Door' },
	konpekiTowerParkingLiftOne = { x = -2250, y = 1729, z = 19, type = 'LiftDevice' },
	konpekiTowerBarrier1 = { x = -2259.5989, y = 1707.0662, z = 19.0, type = 'Door' },
	
	-- Gig Penthouse
	gigPenthouseBuildingDoor = { x = -1185, y = 1401, z = nil, type = 'Door' },
	
	-- Voodoo Chapel Undergroud Base
	voodooUndergroundDoor = { x = -1733, y = -1903, z = nil, type = 'Door' },
	
	-- Clouds
	cloudsEntranceDoor = { x = -637, y = 806, z = nil, type = 'Door' },
	cloudsSecretAreaDoor1 = { x = -648, y = 791, z = nil, type = 'Door' },
	cloudsSecretAreaDoor2 = { x = -655, y = 796, z = 132, type = 'Door' },
	cloudsGlassDoor = { x = -663, y = 807, z = 128, type = 'Door' },
	cloudsLift = { x = -686, y = 805, z = 36, type = 'LiftDevice' },

	-- Maelstrom Hideout
	maelstromHideoutGarage = { x = -774, y = 2203, z = 51, type = 'Door' },
	maelstromHideoutDoor1 = { x = -828, y = 2236, z = 55, type = 'FakeDoor' },
	maelstromHideoutDoor2 = { x = -878, y = 2221, z = 61, type = 'Door' },
	maelstromHideoutDoor3 = { x = -785, y = 2189, z = 53, type = 'Door' },

	-- Sandra Dorsett
	sandraDorsettRescueSecretRoom = { x = -453, y = 390, z = 132, type = 'Door' },
	sandraDorsettApartmentDoor = { x = -1283, y = 1519, z = 45, type = 'Door' },

	-- Peralez Penthouse
	peralezPenthouseBuildingDoor = { x = -65, y = -99, z = 7, type = 'Door' },
	peralezPenthouseLookedDoor1 = { x = -78, y = -112, z = 111, type = 'Door' },
	peralezPenthouseLookedDoor2 = { x = -99, y = -111, z = 111, type = 'Door' },
	peralezPenthouseLookedDoor3 = { x = -69, y = -128, z = 111, type = 'Door' },
	peralezPenthouseSecretDoor1 = { x = -68, y = -121, z = 115, type = 'Door' },
	peralezPenthouseSecretDoor2 = { x = -69, y = -122, z = 123, type = 'Door' },

	-- MLK and Brendon Hotel
	MLKandBrendonHotelDoor1 = { x = -574, y = -828, z = 8, type = 'Door' },
	MLKandBrendonHotelDoor2 = { x = -570, y = -800, z = 8, type = 'Door' },
	MLKandBrendonHotelDoor3 = { x = -567, y = -821, z = 12, type = 'Door' },
	MLKandBrendonHotelDoor4 = { x = -581, y = -834, z = 12, type = 'Door' },

	-- Delamain HQ
	delamainHQMainDoor = { x = -951, y = -86, z = 8, type = 'Door' },
	delamainHQGarage1 = { x = -988, y = -110, z = 4, type = 'Door' },
	delamainHQGarage2 = { x = -978, y = -129, z = 4, type = 'Door' },
	delamainHQDoor1 = { x = -949, y = -90, z = 8, type = 'Door' },
	delamainHQDoor2 = { x = -945, y = -93, z = 8, type = 'Door' },
	delamainHQDoor3 = { x = -933, y = -106, z = 7, type = 'Door' },
	delamainHQDoor4 = { x = -958, y = -87, z = 8, type = 'Door' },
	delamainHQDoor5 = { x = -969, y = -106, z = 8, type = 'FakeDoor' },
	delamainHQDoor6 = { x = -971, y = -98, z = 8, type = 'Door' },
	delamainHQDoor7 = { x = -973, y = -123, z = 6, type = 'Door' },
	delamainHQDoor8 = { x = -958, y = -156, z = 7, type = 'Door' },
	delamainHQDoor9 = { x = -966, y = -153, z = 2, type = 'Door' },
	delamainHQDoor10 = { x = -979, y = -139, z = 3, type = 'Door' },
	delamainHQDoor11 = { x = -984, y = -149, z = 6, type = 'FakeDoor' },
	delamainHQDoor12 = { x = -972, y = -162, z = 8, type = 'Door' },

}

local locations = {
	-- V Mansion
	vMansionIn = { x1 = -1362.7366, y1 = 1262.9171, x2 = -1360.1641, y2 = 1261.3978, z = nil, ang = { min = 131, max = 214 }, tp = { x = -1340.8207, y = 1189.0009, z = 115.00717, w = 1.0, ang = 355.86430751414 } },
	vMansionOut = { x1 = -1340.0024, y1 = 1188.9678, x2 = -1341.3989, y2 = 1189.8715, z = nil, ang = { min = 126, max = 175 }, tp = { x = -1361.6105, y = 1261.4937, z = 41.500008, w = 1.0, ang = 354.29516260943 } },
	
	-- Atlantis Bar
	atlantisBarIn = { x1 = -770.48676, y1 = 1106.0305, x2 = -771.2676, y2 = 1103.9075, z = nil, ang = { min = -121, max = -54 }, tp = { x = -764.93384, y = 1105.6572, z = 29.0, w = 1.0, ang = 277.87610919623 } },
	atlantisBarOut = { x1 = -769.0687, y1 = 1104.3372, x2 = -765.288, y2 = 1106.9291, z = nil, ang = { min = 75, max = 112 }, tp = { x = -770.46277, y = 1105.0232, z = 29.0, w = 1.0, ang = 95.82663528188 } },

	-- Konpeki Tower
	konpekiTowerGateIn = { x1 = -2111.5012, y1 = 1778.6323, x2 = -2115.0469, y2 = 1802.474, z = nil, ang = { min = 70, max = 153 }, tp = { x = -2126.5457, y = 1789.7084, z = 18.21, w = 1.0, ang = 86.517776489258 } },
	konpekiTowerGateOut = { x1 = -2123.955, y1 = 1797.2015, x2 = -2119.6572, y2 = 1774.1086, z = nil, ang = { min = -100, max = -27 }, tp = { x = -2109.7732, y = 1787.4629, z = 18.175941, w = 1.0, ang = -58.917133331299 } },
	konpekiTowerPenthouseOut = { x1 = -2230.854, y1 = 1771.3029, x2 = -2228.2234, y2 = 1771.665, z = nil, ang = { min = -1, max = 60 }, tp = { x = -2227.602, y = 1768.0632, z = 20.0, w = 1.0, ang = -149.49726867676 } },
	konpekiTowerPlazaFakeDoorIn = { x1 = -2186.367, y1 = 1725.5879, x2 = -2189.073, y2 = 1722.2958, z = nil, ang = { min = -87, max = -35 }, tp = { x = -2185.6116, y = 1725.1577, z = 20.0, w = 1.0, ang = -58.598033905029 } },
	konpekiTowerPlazaFakeDoorOut = { x1 = -2184.1187, y1 = 1726.8806, x2 = -2186.6343, y2 = 1723.6713, z = nil, ang = { min = 94, max = 142 }, tp = { x = -2187.1292, y = 1723.9705, z = 20.0, w = 1.0, ang = 120.94380950928 } },
	konpekiTowerSuiteLobbyIn = { x1 = -2176.688, y1 = 1727.4642, x2 = -2180.1313, y2 = 1724.5232, z = nil, ang = { min = -177, max = 122 }, tp = { x = -2227.415, y = 1754.911, z = 163.01, w = 1.0, ang = -60.963676452637 } },
	konpekiTowerSuiteLobbyOut = { x1 = -2225.5898, y1 = 1756.5795, x2 = -2227.7063, y2 = 1754.4653, z = nil, ang = { min = 89, max = 155 }, tp = { x = -2178.61, y = 1725.702, z = 20.0, w = 1.0, ang = 32.165939331055 } },
	konpekiTowerSecretRoom1In = { x1 = -2186.8623, y1 = 1775.0294, x2 = -2188.7544, y2 = 1773.3333, z = 163, ang = { min = -178, max = -115 }, tp = { x = -2200.2468, y = 1777.4227, z = 155.0, w = 1.0, ang = 30.079713821411 } },
	konpekiTowerSecretRoom1Out = { x1 = -2199.3496, y1 = 1778.2903, x2 = -2201.023, y2 = 1777.1056, z = 155, ang = { min = -168, max = -116 }, tp = { x = -2187.7134, y = 1773.9803, z = 163.01, w = 1.0, ang = 29.965148925781 } },
	konpekiTowerSecretRoom2In = { x1 = 2178.8638, y1 = 1787.1606, x2 = -2180.7163, y2 = 1785.5, z = 163, ang = { min = 6, max = 70 }, tp = { x = -2200.6565, y = 1777.8875, z = 147.0, w = 1.0, ang = 30.24005317688 } },
	konpekiTowerSecretRoom2Out = { x1 = -2199.5852, y1 = 1779.1616, x2 = -2201.5017, y2 = 1777.5187, z = 147, ang = { min = -172, max = -121 }, tp = { x = -2179.7036, y = 1786.2086, z = 163.01, w = 1.0, ang = -149.6848449707 } },
	konpekiTowerSecretRoom3In = { x1 = -2210.8457, y1 = 1768.6658, x2 = -2212.741, y2 = 1766.9113, z = 163, ang = { min = 6, max = 70 }, tp = { x = -2200.8247, y = 1778.309, z = 139.0, w = 1.0, ang = 28.15535736084 } },
	konpekiTowerSecretRoom3Out = { x1 = -2199.6538, y1 = 1779.2875, x2 = -2201.5762, y2 = 1777.4906, z = 139, ang = { min = -177, max = -121 }, tp = { x = -2211.9104, y = 1767.8201, z = 163.01001, w = 1.0, ang = -151.33483886719 } },
	konpekiTowerSecretRoom4In = { x1 = -2205.9104, y1 = 1753.5205, x2 = -2207.4482, y2 = 1751.6868, z = 163, ang = { min = -86, max = -29 }, tp = { x = -2201.2744, y = 1779.4202, z = 122.8, w = 1.0, ang = 28.609071731567 } },
	konpekiTowerSecretRoom4Out = { x1 = -2200.3833, y1 = 1780.5854, x2 = -2202.0574, y2 = 1778.7885, z = 123, ang = { min = -170, max = -121 }, tp = { x = -2206.7888, y = 1752.9232, z = 163.01001, w = 1.0, ang = 121.31513214111 } },
}

local slotMachines = {
	-- V Apartment
	vApartmentOutsideVendorMachine = { x = -1394, y = 1278, z = 123, spawnLoc = { x = -1394.4841, y = 1277.2742, z = 123.1824, w = 1.0 }, type = 'Special' },
}



-- print(Game.GetTargetingSystem():GetLookAtObject(Game.GetPlayer(), false, false):GetWorldPosition())

registerForEvent("onInit", function()
	print("[Unlock NightCity] Initialized | Version: 1.3.1")
	readTime()
end)

registerForEvent("onUpdate", function()

	if (ImGui.IsKeyPressed(0x46, false)) then -- Press F
		player = Game.GetPlayer()
		pPos = player:GetWorldPosition()
		ang = player:GetWorldYaw()

		for loc, coords in pairs(locations) do

			x = pPos.x
			y = pPos.y
			z = pPos.z
			minx = math.min(coords.x1, coords.x2)
			maxx = math.max(coords.x1, coords.x2)
			miny = math.min(coords.y1, coords.y2)
			maxy = math.max(coords.y1, coords.y2)


			intersect = (x >= minx and x <= maxx) and (y >= miny and y <= maxy)
			matchz = coords.z == nil or coords.z == round(z)

			orientation = (ang > coords.ang.min) and (ang < coords.ang.max)

			if intersect and orientation and matchz then
				vTp = Vector4.new(coords.tp.x,coords.tp.y,coords.tp.z,coords.tp.w)
				tp:Teleport(player, vTp , EulerAngles.new(0,0,coords.tp.ang))
				return
			end
		end

		object = tt:GetLookAtObject(player, false, false)
		if object then 
			objCoords = object:GetWorldPosition()

			if string.sub(GameDump(object), 0, 11) == "LiftDevice[" then
				unlockLiftDevice(object)
				return
			end

			if string.sub(GameDump(object), 0, 22) == "ElevatorFloorTerminal[" then
				unlockElevatorTerminal(object)
				return
			end

		
			if object:ToString() == 'VendingMachine' then
				local currentTime = tsm:GetGameTimeStamp()
				local lastTimeUsedSlot = qs:GetFactStr("lastTimeUsedSlot")

				for sMachine, sMachineData in pairs(slotMachines) do

					match = sMachineData.x == round(objCoords.x) and sMachineData.y == round(objCoords.y)
					matchz = sMachineData.z == nil or sMachineData.z == round(objCoords.z)
	
					if match and matchz then
	
						if(slotCoolDownTime == 0 or currentTime > lastTimeUsedSlot) then

							isCoolingDown = false

							-- if(not object:IsActive()) then
							-- 	ps:QueuePSDeviceEvent(object:GetDevicePS():ActionToggleON())
							-- end
	
							local item = generateRandomItem() -- Generate Random Item
	
							ts:GiveItem(object, item , 1) -- Give Item to slotMachine
	
							local itemData = ts:GetItemData(object, item) -- Get Item Data
							
							generateRandomQuality(itemData) -- Generate Random Quality
			
							lm:SpawnItemDrop(object, item, ToVector4{ x = sMachineData.spawnLoc.x, y = sMachineData.spawnLoc.y, z = sMachineData.spawnLoc.z, w = 1.0 } , Game.GetPlayer():GetWorldOrientation())

							qs:SetFactStr("lastTimeUsedSlot", getNextSlotUsableTime())

							enableTooltip()
						else
							isCoolingDown = true
							enableTooltip()
						end

						return
					end
	
				end

			end

			for device, deviceData in pairs(allowedDoors) do

				match = deviceData.x == round(objCoords.x) and deviceData.y == round(objCoords.y)
				matchz = deviceData.z == nil or deviceData.z == round(objCoords.z)

				if match and matchz then

					if deviceData.type == "Door" then 
						unlockDoor(object)
					elseif deviceData.type == "FakeDoor" then
						unlockFakeDoor(object)
					elseif deviceData.type == "LiftDevice" then
						unlockLiftDevice(object)
					elseif deviceData.type == "ElevatorFloorTerminal" then
						unlockElevatorTerminal(object)
					end

					return
				end

			end

		end
	end

end)


registerForEvent("onDraw", function()
	ImGui.PushStyleColor(ImGuiCol.PopupBg, 0.21, 0.08, 0.08, 0.85)
	ImGui.PushStyleColor(ImGuiCol.Border, 0.4, 0.17, 0.12, 1)
	ImGui.PushStyleColor(ImGuiCol.Separator, 0.4, 0.17, 0.12, 1)
	if (showSlotWindow) then
		drawSlotWindow()
		if (os:clock() > windowOpenTime + 1) then
			showSlotWindow = false
		end
	end
	ImGui.PopStyleColor(3)
end)

