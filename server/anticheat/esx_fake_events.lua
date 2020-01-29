-- ESX_DRUGS

RegisterServerEvent('esx_drugs:sellDrug')
AddEventHandler('esx_drugs:sellDrug', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startHarvestWeed')
end)

RegisterServerEvent('esx_drugs:pickedUpCannabis')
AddEventHandler('esx_drugs:pickedUpCannabis', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:pickedUpCannabis')
end)

RegisterServerEvent('esx_drugs:processCannabis')
AddEventHandler('esx_drugs:processCannabis', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:processCannabis')
end)

RegisterServerEvent('esx_drugs:cancelProcessing')
AddEventHandler('esx_drugs:cancelProcessing', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:cancelProcessing')
end)

RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startHarvestCoke')
end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopHarvestCoke')
end)

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startTransformCoke')
end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopTransformCoke')
end)

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startSellCoke')
end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopSellCoke')
end)

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startHarvestMeth')
end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopHarvestMeth')
end)

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startTransformMeth')
end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopTransformMeth')
end)

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startSellMeth')
end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopSellMeth')
end)

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startHarvestWeed')
end)

RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopHarvestWeed')
end)

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startTransformWeed')
end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopTransformWeed')
end)

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startSellWeed')
end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopSellWeed')
end)

RegisterServerEvent('esx_drugs:startHarvestOpium')
AddEventHandler('esx_drugs:startHarvestOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startHarvestOpium')
end)

RegisterServerEvent('esx_drugs:stopHarvestOpium')
AddEventHandler('esx_drugs:stopHarvestOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopHarvestOpium')
end)

RegisterServerEvent('esx_drugs:startTransformOpium')
AddEventHandler('esx_drugs:startTransformOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startTransformOpium')
end)

RegisterServerEvent('esx_drugs:stopTransformOpium')
AddEventHandler('esx_drugs:stopTransformOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopTransformOpium')
end)

RegisterServerEvent('esx_drugs:startSellOpium')
AddEventHandler('esx_drugs:startSellOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:startSellOpium')
end)

RegisterServerEvent('esx_drugs:stopSellOpium')
AddEventHandler('esx_drugs:stopSellOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:stopSellOpium')
end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function()
	TAC.BanPlayerByEvent(source, 'esx_drugs:GetUserInventory')
end)

-- ESX_ILLEGAL_DRUGS

RegisterServerEvent('esx_illegal_drugs:startHarvestWeed')
AddEventHandler('esx_illegal_drugs:startHarvestWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startHarvestWeed')
end)

RegisterServerEvent('esx_illegal_drugs:stopHarvestWeed')
AddEventHandler('esx_illegal_drugs:stopHarvestWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopHarvestWeed')
end)

RegisterServerEvent('esx_illegal_drugs:startTransformWeed')
AddEventHandler('esx_illegal_drugs:startTransformWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startTransformWeed')
end)

RegisterServerEvent('esx_illegal_drugs:stopTransformWeed')
AddEventHandler('esx_illegal_drugs:stopTransformWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopTransformWeed')
end)

RegisterServerEvent('esx_illegal_drugs:startSellWeed')
AddEventHandler('esx_illegal_drugs:startSellWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startSellWeed')
end)

RegisterServerEvent('esx_illegal_drugs:stopSellWeed')
AddEventHandler('esx_illegal_drugs:stopSellWeed', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopSellWeed')
end)

RegisterServerEvent('esx_illegal_drugs:startHarvestOpium')
AddEventHandler('esx_illegal_drugs:startHarvestOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startHarvestOpium')
end)

RegisterServerEvent('esx_illegal_drugs:stopHarvestOpium')
AddEventHandler('esx_illegal_drugs:stopHarvestOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopHarvestOpium')
end)

RegisterServerEvent('esx_illegal_drugs:startTransformOpium')
AddEventHandler('esx_illegal_drugs:startTransformOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startTransformOpium')
end)

RegisterServerEvent('esx_illegal_drugs:stopTransformOpium')
AddEventHandler('esx_illegal_drugs:stopTransformOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopTransformOpium')
end)

RegisterServerEvent('esx_illegal_drugs:startSellOpium')
AddEventHandler('esx_illegal_drugs:startSellOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startSellOpium')
end)

RegisterServerEvent('esx_illegal_drugs:stopSellOpium')
AddEventHandler('esx_illegal_drugs:stopSellOpium', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopSellOpium')
end)

RegisterServerEvent('esx_illegal_drugs:startHarvestCoke')
AddEventHandler('esx_illegal_drugs:startHarvestCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startHarvestCoke')
end)

RegisterServerEvent('esx_illegal_drugs:stopHarvestCoke')
AddEventHandler('esx_illegal_drugs:stopHarvestCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopHarvestCoke')
end)

RegisterServerEvent('esx_illegal_drugs:startTransformCoke')
AddEventHandler('esx_illegal_drugs:startTransformCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startTransformCoke')
end)

RegisterServerEvent('esx_illegal_drugs:stopTransformCoke')
AddEventHandler('esx_illegal_drugs:stopTransformCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopTransformCoke')
end)

RegisterServerEvent('esx_illegal_drugs:startSellCoke')
AddEventHandler('esx_illegal_drugs:startSellCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startSellCoke')
end)

RegisterServerEvent('esx_illegal_drugs:stopSellCoke')
AddEventHandler('esx_illegal_drugs:stopSellCoke', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopSellCoke')
end)

RegisterServerEvent('esx_illegal_drugs:startHarvestMeth')
AddEventHandler('esx_illegal_drugs:startHarvestMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startHarvestMeth')
end)

RegisterServerEvent('esx_illegal_drugs:stopHarvestMeth')
AddEventHandler('esx_illegal_drugs:stopHarvestMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopHarvestMeth')
end)

RegisterServerEvent('esx_illegal_drugs:startTransformMeth')
AddEventHandler('esx_illegal_drugs:startTransformMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startTransformMeth')
end)

RegisterServerEvent('esx_illegal_drugs:stopTransformMeth')
AddEventHandler('esx_illegal_drugs:stopTransformMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopTransformMeth')
end)

RegisterServerEvent('esx_illegal_drugs:startSellMeth')
AddEventHandler('esx_illegal_drugs:startSellMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:startSellMeth')
end)

RegisterServerEvent('esx_illegal_drugs:stopSellMeth')
AddEventHandler('esx_illegal_drugs:stopSellMeth', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:stopSellMeth')
end)

RegisterServerEvent('esx_illegal_drugs:GetUserInventory')
AddEventHandler('esx_illegal_drugs:GetUserInventory', function()
	TAC.BanPlayerByEvent(source, 'esx_illegal_drugs:GetUserInventory')
end)

-- ESX_POLICEJOB

RegisterServerEvent('esx_policejob:confiscatePlayerItem')
AddEventHandler('esx_policejob:confiscatePlayerItem', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:confiscatePlayerItem')
end)

RegisterServerEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:handcuff')
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:drag')
end)

RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:putInVehicle')
end)

RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:OutVehicle')
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:getStockItem')
end)

RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:putStockItems')
end)

RegisterServerEvent('esx_policejob:spawned')
AddEventHandler('esx_policejob:spawned', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:spawned')
end)

RegisterServerEvent('esx_policejob:forceBlip')
AddEventHandler('esx_policejob:forceBlip', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:forceBlip')
end)

RegisterServerEvent('esx_policejob:giveWeapon')
AddEventHandler('esx_policejob:giveWeapon', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:giveWeapon')
end)

RegisterServerEvent('esx_policejob:setVehicleState')
AddEventHandler('esx_policejob:setVehicleState', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:setVehicleState')
end)

RegisterServerEvent('esx_policejob:message')
AddEventHandler('esx_policejob:message', function()
	TAC.BanPlayerByEvent(source, 'esx_policejob:message')
end)

-- ESX_LSCUSTOM

RegisterServerEvent('esx_lscustom:buyMod')
AddEventHandler('esx_lscustom:buyMod', function()
	TAC.BanPlayerByEvent(source, 'esx_lscustom:buyMod')
end)

RegisterServerEvent('esx_lscustom:refreshOwnedVehicle')
AddEventHandler('esx_lscustom:refreshOwnedVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_lscustom:refreshOwnedVehicle')
end)

-- ES_EXTENDED

RegisterServerEvent('esx:clientLog')
AddEventHandler('esx:clientLog', function()
	TAC.BanPlayerByEvent(source, 'esx:clientLog')
end)

RegisterServerEvent('esx:triggerServerCallback')
AddEventHandler('esx:triggerServerCallback', function()
	TAC.BanPlayerByEvent(source, 'esx:triggerServerCallback')
end)

RegisterServerEvent('esx:updateLoadout')
AddEventHandler('esx:updateLoadout', function()
	TAC.BanPlayerByEvent(source, 'esx:updateLoadout')
end)

RegisterServerEvent('esx:updateLastPosition')
AddEventHandler('esx:updateLastPosition', function()
	TAC.BanPlayerByEvent(source, 'esx:updateLastPosition')
end)

RegisterServerEvent('esx:giveInventoryItem')
AddEventHandler('esx:giveInventoryItem', function()
	TAC.BanPlayerByEvent(source, 'esx:giveInventoryItem')
end)

RegisterServerEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function()
	TAC.BanPlayerByEvent(source, 'esx:removeInventoryItem')
end)

RegisterServerEvent('esx:useItem')
AddEventHandler('esx:useItem', function()
	TAC.BanPlayerByEvent(source, 'esx:useItem')
end)

RegisterServerEvent('esx:onPickup')
AddEventHandler('esx:onPickup', function()
	TAC.BanPlayerByEvent(source, 'esx:onPickup')
end)

-- ESX_MECHANICJOB

RegisterServerEvent('esx_mechanicjob:startHarvest')
AddEventHandler('esx_mechanicjob:startHarvest', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:startHarvest')
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest')
AddEventHandler('esx_mechanicjob:stopHarvest', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopHarvest')
end)

RegisterServerEvent('esx_mechanicjob:startHarvest2')
AddEventHandler('esx_mechanicjob:startHarvest2', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:startHarvest2')
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest2')
AddEventHandler('esx_mechanicjob:stopHarvest2', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopHarvest2')
end)

RegisterServerEvent('esx_mechanicjob:startHarvest3')
AddEventHandler('esx_mechanicjob:startHarvest3', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:startHarvest3')
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest3')
AddEventHandler('esx_mechanicjob:stopHarvest3', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopHarvest3')
end)

RegisterServerEvent('esx_mechanicjob:stopHarvest3')
AddEventHandler('esx_mechanicjob:stopHarvest3', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopHarvest3')
end)

RegisterServerEvent('esx_mechanicjob:startCraft')
AddEventHandler('esx_mechanicjob:startCraft', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:startCraft')
end)

RegisterServerEvent('esx_mechanicjob:stopCraft')
AddEventHandler('esx_mechanicjob:stopCraft', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopCraft')
end)

RegisterServerEvent('esx_mechanicjob:startCraft2')
AddEventHandler('esx_mechanicjob:startCraft2', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:startCraft2')
end)

RegisterServerEvent('esx_mechanicjob:stopCraft2')
AddEventHandler('esx_mechanicjob:stopCraft2', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopCraft2')
end)

RegisterServerEvent('esx_mechanicjob:startCraft3')
AddEventHandler('esx_mechanicjob:startCraft3', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:startCraft3')
end)

RegisterServerEvent('esx_mechanicjob:stopCraft3')
AddEventHandler('esx_mechanicjob:stopCraft3', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:stopCraft3')
end)

RegisterServerEvent('esx_mechanicjob:onNPCJobMissionCompleted')
AddEventHandler('esx_mechanicjob:onNPCJobMissionCompleted', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:onNPCJobMissionCompleted')
end)

RegisterServerEvent('esx_mechanicjob:getStockItem')
AddEventHandler('esx_mechanicjob:getStockItem', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:getStockItem')
end)

RegisterServerEvent('esx_mechanicjob:putStockItems')
AddEventHandler('esx_mechanicjob:putStockItems', function()
	TAC.BanPlayerByEvent(source, 'esx_mechanicjob:putStockItems')
end)

-- ESX_GARBAGEJOB

RegisterServerEvent('esx_garbagejob:pay')
AddEventHandler('esx_garbagejob:pay', function()
	TAC.BanPlayerByEvent(source, 'esx_garbagejob:pay')
end)

-- ESX_GYM

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:hireBmx')
end)

RegisterServerEvent('esx_gym:checkChip')
AddEventHandler('esx_gym:checkChip', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:checkChip')
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:buyMembership')
end)

RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:buyProteinshake')
end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:buyWater')
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:buySportlunch')
end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:buyPowerade')
end)

RegisterServerEvent('esx_gym:trainArms')
AddEventHandler('esx_gym:trainArms', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:trainArms')
end)

RegisterServerEvent('esx_gym:trainChins')
AddEventHandler('esx_gym:trainChins', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:trainChins')
end)

RegisterServerEvent('esx_gym:trainPushups')
AddEventHandler('esx_gym:trainPushups', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:trainPushups')
end)

RegisterServerEvent('esx_gym:trainYoga')
AddEventHandler('esx_gym:trainYoga', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:trainYoga')
end)

RegisterServerEvent('esx_gym:trainSitups')
AddEventHandler('esx_gym:trainSitups', function()
	TAC.BanPlayerByEvent(source, 'esx_gym:trainSitups')
end)

-- ESX_IDENTITY

RegisterServerEvent('esx_identity:setIdentity')
AddEventHandler('esx_identity:setIdentity', function()
	TAC.BanPlayerByEvent(source, 'esx_identity:setIdentity')
end)

RegisterServerEvent('esx_identity:NewIdentity')
AddEventHandler('esx_identity:NewIdentity', function()
	TAC.BanPlayerByEvent(source, 'esx_identity:NewIdentity')
end)

-- ESX_JAILER

RegisterServerEvent('esx_jailer:sendToJail')
AddEventHandler('esx_jailer:sendToJail', function()
	TAC.BanPlayerByEvent(source, 'esx_jailer:sendToJail')
end)

RegisterServerEvent('esx_jailer:checkJail')
AddEventHandler('esx_jailer:checkJail', function()
	TAC.BanPlayerByEvent(source, 'esx_jailer:checkJail')
end)

RegisterServerEvent('esx_jailer:unjailQuest')
AddEventHandler('esx_jailer:unjailQuest', function()
	TAC.BanPlayerByEvent(source, 'esx_jailer:unjailQuest')
end)

RegisterServerEvent('esx_jailer:unjailTime')
AddEventHandler('esx_jailer:unjailTime', function()
	TAC.BanPlayerByEvent(source, 'esx_jailer:unjailTime')
end)

RegisterServerEvent('esx_jailer:updateRemaining')
AddEventHandler('esx_jailer:updateRemaining', function()
	TAC.BanPlayerByEvent(source, 'esx_jailer:updateRemaining')
end)

-- ESX_JOBLISTING

RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function()
	TAC.BanPlayerByEvent(source, 'esx_joblisting:setJob')
end)

-- ESX_JOBS

RegisterServerEvent('esx_jobs:setCautionInCaseOfDrop')
AddEventHandler('esx_jobs:setCautionInCaseOfDrop', function()
	TAC.BanPlayerByEvent(source, 'esx_jobs:setCautionInCaseOfDrop')
end)

RegisterServerEvent('esx_jobs:giveBackCautionInCaseOfDrop')
AddEventHandler('esx_jobs:giveBackCautionInCaseOfDrop', function()
	TAC.BanPlayerByEvent(source, 'esx_jobs:giveBackCautionInCaseOfDrop')
end)

RegisterServerEvent('esx_jobs:startWork')
AddEventHandler('esx_jobs:startWork', function()
	TAC.BanPlayerByEvent(source, 'esx_jobs:startWork')
end)

RegisterServerEvent('esx_jobs:stopWork')
AddEventHandler('esx_jobs:stopWork', function()
	TAC.BanPlayerByEvent(source, 'esx_jobs:stopWork')
end)

RegisterServerEvent('esx_jobs:caution')
AddEventHandler('esx_jobs:caution', function()
	TAC.BanPlayerByEvent(source, 'esx_jobs:caution')
end)

-- ESX_PIZZA

RegisterServerEvent('esx_pizza:pay')
AddEventHandler('esx_pizza:pay', function()
	TAC.BanPlayerByEvent(source, 'esx_pizza:pay')
end)

-- ESX_PROPERTY

RegisterServerEvent('esx_property:rentProperty')
AddEventHandler('esx_property:rentProperty', function()
	TAC.BanPlayerByEvent(source, 'esx_property:rentProperty')
end)

RegisterServerEvent('esx_property:buyProperty')
AddEventHandler('esx_property:buyProperty', function()
	TAC.BanPlayerByEvent(source, 'esx_property:buyProperty')
end)

RegisterServerEvent('esx_property:removeOwnedProperty')
AddEventHandler('esx_property:removeOwnedProperty', function()
	TAC.BanPlayerByEvent(source, 'esx_property:removeOwnedProperty')
end)

RegisterServerEvent('esx_property:saveLastProperty')
AddEventHandler('esx_property:saveLastProperty', function()
	TAC.BanPlayerByEvent(source, 'esx_property:saveLastProperty')
end)

RegisterServerEvent('esx_property:deleteLastProperty')
AddEventHandler('esx_property:deleteLastProperty', function()
	TAC.BanPlayerByEvent(source, 'esx_property:deleteLastProperty')
end)

RegisterServerEvent('esx_property:getItem')
AddEventHandler('esx_property:getItem', function()
	TAC.BanPlayerByEvent(source, 'esx_property:getItem')
end)

RegisterServerEvent('esx_property:putItem')
AddEventHandler('esx_property:putItem', function()
	TAC.BanPlayerByEvent(source, 'esx_property:putItem')
end)

RegisterServerEvent('esx_property:removeOutfit')
AddEventHandler('esx_property:removeOutfit', function()
	TAC.BanPlayerByEvent(source, 'esx_property:removeOutfit')
end)

-- ESX_RUSKIARREST

RegisterServerEvent('esx_ruski_areszt:startAreszt')
AddEventHandler('esx_ruski_areszt:removeOutfit', function()
	TAC.BanPlayerByEvent(source, 'esx_ruski_areszt:removeOutfit')
end)

-- ESX_SHOPS

RegisterServerEvent('esx_shops:buyItem')
AddEventHandler('esx_shops:buyItem', function()
	TAC.BanPlayerByEvent(source, 'esx_shops:buyItem')
end)

-- ESX_SKIN

RegisterServerEvent('esx_skin:save')
AddEventHandler('esx_skin:save', function()
	TAC.BanPlayerByEvent(source, 'esx_skin:save')
end)

RegisterServerEvent('esx_skin:responseSaveSkin')
AddEventHandler('esx_skin:responseSaveSkin', function()
	TAC.BanPlayerByEvent(source, 'esx_skin:responseSaveSkin')
end)

-- ESX_SOCIETY

RegisterServerEvent('esx_society:withdrawMoney')
AddEventHandler('esx_society:withdrawMoney', function()
	TAC.BanPlayerByEvent(source, 'esx_society:withdrawMoney')
end)

RegisterServerEvent('esx_society:depositMoney')
AddEventHandler('esx_society:depositMoney', function()
	TAC.BanPlayerByEvent(source, 'esx_society:depositMoney')
end)

RegisterServerEvent('esx_society:washMoney')
AddEventHandler('esx_society:washMoney', function()
	TAC.BanPlayerByEvent(source, 'esx_society:washMoney')
end)

RegisterServerEvent('esx_society:putVehicleInGarage')
AddEventHandler('esx_society:putVehicleInGarage', function()
	TAC.BanPlayerByEvent(source, 'esx_society:putVehicleInGarage')
end)

RegisterServerEvent('esx_society:removeVehicleFromGarage')
AddEventHandler('esx_society:removeVehicleFromGarage', function()
	TAC.BanPlayerByEvent(source, 'esx_society:removeVehicleFromGarage')
end)

-- ESX_VANGELICO_ROBBERY

RegisterServerEvent('esx_vangelico_robbery:toofar')
AddEventHandler('esx_vangelico_robbery:toofar', function()
	TAC.BanPlayerByEvent(source, 'esx_vangelico_robbery:toofar')
end)

RegisterServerEvent('esx_vangelico_robbery:endrob')
AddEventHandler('esx_vangelico_robbery:endrob', function()
	TAC.BanPlayerByEvent(source, 'esx_vangelico_robbery:endrob')
end)

RegisterServerEvent('esx_vangelico_robbery:rob')
AddEventHandler('esx_vangelico_robbery:rob', function()
	TAC.BanPlayerByEvent(source, 'esx_vangelico_robbery:rob')
end)

RegisterServerEvent('esx_vangelico_robbery:gioielli')
AddEventHandler('esx_vangelico_robbery:gioielli', function()
	TAC.BanPlayerByEvent(source, 'esx_vangelico_robbery:gioielli')
end)

-- ESX_VEHICLESHOP

RegisterServerEvent('esx_vehicleshop:setVehicleOwned')
AddEventHandler('esx_vehicleshop:setVehicleOwned', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:setVehicleOwned')
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedPlayerId')
AddEventHandler('esx_vehicleshop:setVehicleOwnedPlayerId', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:setVehicleOwnedPlayerId')
end)

RegisterServerEvent('esx_vehicleshop:setVehicleOwnedSociety')
AddEventHandler('esx_vehicleshop:setVehicleOwnedSociety', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:setVehicleOwnedSociety')
end)

RegisterServerEvent('esx_vehicleshop:sellVehicle')
AddEventHandler('esx_vehicleshop:sellVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:sellVehicle')
end)

RegisterServerEvent('esx_vehicleshop:addToList')
AddEventHandler('esx_vehicleshop:addToList', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:addToList')
end)

RegisterServerEvent('esx_vehicleshop:rentVehicle')
AddEventHandler('esx_vehicleshop:rentVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:rentVehicle')
end)

RegisterServerEvent('esx_vehicleshop:getStockItem')
AddEventHandler('esx_vehicleshop:getStockItem', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:getStockItem')
end)

RegisterServerEvent('esx_vehicleshop:putStockItems')
AddEventHandler('esx_vehicleshop:putStockItems', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:putStockItems')
end)

RegisterServerEvent('esx_vehicleshop:returnProvider')
AddEventHandler('esx_vehicleshop:returnProvider', function()
	TAC.BanPlayerByEvent(source, 'esx_vehicleshop:returnProvider')
end)

-- ESX_GALLE_SELLVEHICLES

RegisterServerEvent('esx-qalle-sellvehicles:setVehicleState')
AddEventHandler('esx-qalle-sellvehicles:setVehicleState', function()
	TAC.BanPlayerByEvent(source, 'esx-qalle-sellvehicles:setVehicleState')
end)

-- ESX_TRUCKERJOB

RegisterServerEvent('esx_truckerjob:pay')
AddEventHandler('esx_truckerjob:pay', function()
	TAC.BanPlayerByEvent(source, 'esx_truckerjob:pay')
end)

-- ESX_BILLING

RegisterServerEvent('esx_billing:sendBill')
AddEventHandler('esx_billing:sendBill', function()
	TAC.BanPlayerByEvent(source, 'esx_billing:sendBill')
end)

-- ESX_ADMINMENU

RegisterServerEvent('esx_adminmenu:confiscatePlayerItem')
AddEventHandler('esx_adminmenu:confiscatePlayerItem', function()
	TAC.BanPlayerByEvent(source, 'esx_adminmenu:confiscatePlayerItem')
end)

-- ESX_AMBULANCEJOB

RegisterServerEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:revive')
end)

RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:heal')
end)

RegisterServerEvent('esx_ambulancejob:placeinback')
AddEventHandler('esx_ambulancejob:placeinback', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:placeinback')
end)

RegisterServerEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:removeItem')
end)

RegisterServerEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:giveItem')
end)

RegisterServerEvent('esx_ambulancejob:firstSpawn')
AddEventHandler('esx_ambulancejob:firstSpawn', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:firstSpawn')
end)

RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:setDeathStatus')
end)

RegisterServerEvent('esx_ambulancejob:spawned')
AddEventHandler('esx_ambulancejob:spawned', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:spawned')
end)

RegisterServerEvent('esx_ambulancejob:forceBlip')
AddEventHandler('esx_ambulancejob:forceBlip', function()
	TAC.BanPlayerByEvent(source, 'esx_ambulancejob:forceBlip')
end)

-- ESX_BANKERJOB

RegisterServerEvent('esx_bankerjob:customerDeposit')
AddEventHandler('esx_bankerjob:customerDeposit', function()
	TAC.BanPlayerByEvent(source, 'esx_bankerjob:customerDeposit')
end)

RegisterServerEvent('esx_bankerjob:customerWithdraw')
AddEventHandler('esx_bankerjob:customerWithdraw', function()
	TAC.BanPlayerByEvent(source, 'esx_bankerjob:customerWithdraw')
end)

-- ESX_BARBERSHOP

RegisterServerEvent('esx_barbershop:pay')
AddEventHandler('esx_barbershop:pay', function()
	TAC.BanPlayerByEvent(source, 'esx_barbershop:pay')
end)

-- ESX_CARTHIEF

RegisterServerEvent('esx_carthief:pay')
AddEventHandler('esx_carthief:pay', function()
	TAC.BanPlayerByEvent(source, 'esx_carthief:pay')
end)

RegisterServerEvent('esx_carthief:registerActivity')
AddEventHandler('esx_carthief:registerActivity', function()
	TAC.BanPlayerByEvent(source, 'esx_carthief:registerActivity')
end)

RegisterServerEvent('esx_carthief:alertcops')
AddEventHandler('esx_carthief:alertcops', function()
	TAC.BanPlayerByEvent(source, 'esx_carthief:alertcops')
end)

RegisterServerEvent('esx_carthief:stopalertcops')
AddEventHandler('esx_carthief:stopalertcops', function()
	TAC.BanPlayerByEvent(source, 'esx_carthief:stopalertcops')
end)

-- ESX_CLOTHESHOP

RegisterServerEvent('esx_clotheshop:saveOutfit')
AddEventHandler('esx_clotheshop:saveOutfit', function()
	TAC.BanPlayerByEvent(source, 'esx_clotheshop:saveOutfit')
end)

-- ESX_CUSTOMCARDEALER

RegisterServerEvent('esx_Customcardealer:refreshOwnedVehicle')
AddEventHandler('esx_Customcardealer:refreshOwnedVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:refreshOwnedVehicle')
end)

RegisterServerEvent('esx_Customcardealer:setVehicleOwned')
AddEventHandler('esx_Customcardealer:setVehicleOwned', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:setVehicleOwned')
end)

RegisterServerEvent('esx_Customcardealer:setVehicleOwnedPlayerId')
AddEventHandler('esx_Customcardealer:setVehicleOwnedPlayerId', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:setVehicleOwnedPlayerId')
end)

RegisterServerEvent('esx_Customcardealer:setVehicleOwnedSociety')
AddEventHandler('esx_Customcardealer:setVehicleOwnedSociety', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:setVehicleOwnedSociety')
end)

RegisterServerEvent('esx_Customcardealer:Testdrive')
AddEventHandler('esx_Customcardealer:Testdrive', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:Testdrive')
end)

RegisterServerEvent('esx_Customcardealer:RemoveTestdrive')
AddEventHandler('esx_Customcardealer:RemoveTestdrive', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:RemoveTestdrive')
end)

RegisterServerEvent('esx_Customcardealer:resellVehicleNotify')
AddEventHandler('esx_Customcardealer:resellVehicleNotify', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:resellVehicleNotify')
end)

RegisterServerEvent('esx_Customcardealer:resellVehicleSold')
AddEventHandler('esx_Customcardealer:resellVehicleSold', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:resellVehicleSold')
end)

RegisterServerEvent('esx_Customcardealer:RegisterResellVehicle')
AddEventHandler('esx_Customcardealer:RegisterResellVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:RegisterResellVehicle')
end)

RegisterServerEvent('esx_Customcardealer:sellVehicle')
AddEventHandler('esx_Customcardealer:sellVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:sellVehicle')
end)

RegisterServerEvent('esx_Customcardealer:CancelDeal')
AddEventHandler('esx_Customcardealer:CancelDeal', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:CancelDeal')
end)

RegisterServerEvent('esx_Customcardealer:RegistersellVehicle')
AddEventHandler('esx_Customcardealer:RegistersellVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:RegistersellVehicle')
end)

RegisterServerEvent('esx_Customcardealer:rentVehicle')
AddEventHandler('esx_Customcardealer:rentVehicle', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:rentVehicle')
end)

RegisterServerEvent('esx_Customcardealer:setVehicleForAllPlayers')
AddEventHandler('esx_Customcardealer:setVehicleForAllPlayers', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:setVehicleForAllPlayers')
end)

RegisterServerEvent('esx_Customcardealer:getStockItem')
AddEventHandler('esx_Customcardealer:getStockItem', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:getStockItem')
end)

RegisterServerEvent('esx_Customcardealer:putStockItems')
AddEventHandler('esx_Customcardealer:putStockItems', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:putStockItems')
end)

RegisterServerEvent('esx_Customcardealer:returnProvider')
AddEventHandler('esx_Customcardealer:returnProvider', function()
	TAC.BanPlayerByEvent(source, 'esx_Customcardealer:returnProvider')
end)

-- ESX_DOORLOCK

RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function()
	TAC.BanPlayerByEvent(source, 'esx_doorlock:updateState')
end)

-- ESX_HEADBAG

RegisterServerEvent('esx_worek:closest')
AddEventHandler('esx_worek:closest', function()
	TAC.BanPlayerByEvent(source, 'esx_worek:closest')
end)

RegisterServerEvent('esx_worek:sendclosest')
AddEventHandler('esx_worek:sendclosest', function()
	TAC.BanPlayerByEvent(source, 'esx_worek:sendclosest')
end)

RegisterServerEvent('esx_worek:zdejmij')
AddEventHandler('esx_worek:zdejmij', function()
	TAC.BanPlayerByEvent(source, 'esx_worek:zdejmij')
end)

-- ESX_HOLDUP

RegisterServerEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function()
	TAC.BanPlayerByEvent(source, 'esx_holdup:tooFar')
end)

RegisterServerEvent('esx_holdup:robberyStarted')
AddEventHandler('esx_holdup:robberyStarted', function()
	TAC.BanPlayerByEvent(source, 'esx_holdup:robberyStarted')
end)

-- ESX_HOLDUPBANCO

RegisterServerEvent('esx_holdupbanco:tooFar')
AddEventHandler('esx_holdupbanco:tooFar', function()
	TAC.BanPlayerByEvent(source, 'esx_holdupbanco:tooFar')
end)

RegisterServerEvent('esx_holdupbanco:robberyStarted')
AddEventHandler('esx_holdupbanco:robberyStarted', function()
	TAC.BanPlayerByEvent(source, 'esx_holdupbanco:robberyStarted')
end)

RegisterServerEvent('esx_holdupbanco:robberyEnded')
AddEventHandler('esx_holdupbanco:robberyEnded', function()
	TAC.BanPlayerByEvent(source, 'esx_holdupbanco:robberyEnded')
end)

RegisterServerEvent('esx_holdupbanco:robberyActive')
AddEventHandler('esx_holdupbanco:robberyActive', function()
	TAC.BanPlayerByEvent(source, 'esx_holdupbanco:robberyActive')
end)

-- ESX_TRUNK

RegisterServerEvent('esx_trunk_inventory:getOwnedVehicule')
AddEventHandler('esx_trunk_inventory:getOwnedVehicule', function()
	TAC.BanPlayerByEvent(source, 'esx_trunk_inventory:getOwnedVehicule')
end)

RegisterServerEvent('esx_trunk_inventory:getItem')
AddEventHandler('esx_trunk_inventory:getItem', function()
	TAC.BanPlayerByEvent(source, 'esx_trunk_inventory:getItem')
end)

RegisterServerEvent('esx_trunk_inventory:putItem')
AddEventHandler('esx_trunk_inventory:putItem', function()
	TAC.BanPlayerByEvent(source, 'esx_trunk_inventory:putItem')
end)

-- ESX_INVENTORYHUD

RegisterServerEvent('esx_inventoryhud:tradePlayerItem')
AddEventHandler('esx_inventoryhud:tradePlayerItem', function()
	TAC.BanPlayerByEvent(source, 'esx_inventoryhud:tradePlayerItem')
end)

-- ESX_PHONE

RegisterServerEvent('esx_phone:startCall')
AddEventHandler('esx_phone:startCall', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:startCall')
end)

RegisterServerEvent('esx_phone:acceptCall')
AddEventHandler('esx_phone:acceptCall', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:acceptCall')
end)

RegisterServerEvent('esx_phone:endCall')
AddEventHandler('esx_phone:endCall', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:endCall')
end)

RegisterServerEvent('esx_phone:reload')
AddEventHandler('esx_phone:reload', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:reload')
end)

RegisterServerEvent('esx_phone:send')
AddEventHandler('esx_phone:send', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:send')
end)

RegisterServerEvent('esx_phone:addPlayerContact')
AddEventHandler('esx_phone:addPlayerContact', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:addPlayerContact')
end)

RegisterServerEvent('esx_phone:stopDispatch')
AddEventHandler('esx_phone:stopDispatch', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:stopDispatch')
end)

RegisterServerEvent('esx_phone:billCall')
AddEventHandler('esx_phone:billCall', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:billCall')
end)

RegisterServerEvent('esx_phone:bankTransfer')
AddEventHandler('esx_phone:bankTransfer', function()
	TAC.BanPlayerByEvent(source, 'esx_phone:bankTransfer')
end)

-- ESX_PRISONWORK

RegisterServerEvent('esx_loffe_fangelse:Pay')
AddEventHandler('esx_loffe_fangelse:Pay', function()
	TAC.BanPlayerByEvent(source, 'esx_loffe_fangelse:Pay')
end)

-- ESX_SIT

RegisterServerEvent('esx_interact:takePlace')
AddEventHandler('esx_interact:takePlace', function()
	TAC.BanPlayerByEvent(source, 'esx_interact:takePlace')
end)

RegisterServerEvent('esx_interact:leavePlace')
AddEventHandler('esx_interact:leavePlace', function()
	TAC.BanPlayerByEvent(source, 'esx_interact:leavePlace')
end)

-- ESX_SODAMACHINE

RegisterServerEvent('esx_SodaMachine:buyItem')
AddEventHandler('esx_SodaMachine:buyItem', function()
	TAC.BanPlayerByEvent(source, 'esx_SodaMachine:buyItem')
end)

RegisterServerEvent('esx_SodaMachine:TakeMoney')
AddEventHandler('esx_SodaMachine:TakeMoney', function()
	TAC.BanPlayerByEvent(source, 'esx_SodaMachine:TakeMoney')
end)

RegisterServerEvent('esx_SodaMachine:DrankProduct')
AddEventHandler('esx_SodaMachine:DrankProduct', function()
	TAC.BanPlayerByEvent(source, 'esx_SodaMachine:DrankProduct')
end)

-- ESX_STATUS

RegisterServerEvent('esx_status:update')
AddEventHandler('esx_status:update', function()
	TAC.BanPlayerByEvent(source, 'esx_status:update')
end)