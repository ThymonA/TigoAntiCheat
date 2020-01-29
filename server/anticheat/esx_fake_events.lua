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

-- ESX ILLEGAL DRUGS
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
