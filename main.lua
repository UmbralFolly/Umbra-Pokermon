SMODS.Atlas({
    key = "umbr_Umbrdex1",
    path = "umbr_Umbrdex1.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "umbr_shiny_Umbrdex1",
    path = "umbr_shiny_Umbrdex1.png",
    px = 71,
    py = 95
}):register()

--Required by the pokemon family function (right click on a pokemon joker)
table.insert(pokermon.family, {"tropius"})
table.insert(pokermon.family, {"timburr", "gurdurr", "conkeldurr"})
table.insert(pokermon.family, {"swirlix", "slurpuff", "swirlix_puff"})

-- Get mod path and load other files
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

--Load Joker Display if the mod is enabled
if (SMODS.Mods["JokerDisplay"] or {}).can_load then
  local jokerdisplays = NFS.getDirectoryItems(mod_dir.."jokerdisplay")

  for _, file in ipairs(jokerdisplays) do
    sendDebugMessage ("The file is: "..file)
    local helper, load_error = SMODS.load_file("jokerdisplay/"..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      helper()
    end
  end
end

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
    --Load backs
    local backs = NFS.getDirectoryItems(mod_dir.."backs")
  
    for _, file in ipairs(backs) do
      sendDebugMessage ("The file is: "..file)
      local back, load_error = SMODS.load_file("backs/"..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_back = back()
        if curr_back.init then curr_back:init() end
        
        for i, item in ipairs(curr_back.list) do
          SMODS.Back(item)
        end
      end
    end
  end

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
    --Load stakes
    local stakes = NFS.getDirectoryItems(mod_dir.."stakes")
  
    for _, file in ipairs(stakes) do
      sendDebugMessage ("The file is: "..file)
      local stakes, load_error = SMODS.load_file("stakes/"..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_stake = stakes()
        if curr_stake.init then curr_stake:init() end
        
        for i, item in ipairs(curr_stake.list) do
          SMODS.Stake(item)
        end
      end
    end
  end

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
    --Load stickers
    local stickers = NFS.getDirectoryItems(mod_dir.."stickers")
  
    for _, file in ipairs(stickers) do
      sendDebugMessage ("The file is: "..file)
      local sticker, load_error = SMODS.load_file("stickers/"..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_sticker = sticker()
        if curr_sticker.init then curr_sticker:init() end
        
        for i, item in ipairs(curr_sticker.list) do
          SMODS.Sticker(item)
        end
      end
    end
  end

local pconsumables = NFS.getDirectoryItems(mod_dir.."consumables")

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
  for _, file in ipairs(pconsumables) do
    sendDebugMessage ("The file is: "..file)
    local consumable, load_error = SMODS.load_file("consumables/"..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      local curr_consumable = consumable()
      if curr_consumable.init then curr_consumable:init() end
      
      for i, item in ipairs(curr_consumable.list) do
        if ((not pokermon_config.jokers_only and not item.pokeball) or (item.pokeball and pokermon_config.pokeballs)) or (item.evo_item and not pokermon_config.no_evos) then
          SMODS.Consumable(item)
        end
      end
    end
  end 
end



-- Get mod path and load other files
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

print("DEBUG")

--Load pokemon file
local pfiles = NFS.getDirectoryItems(mod_dir.."pokemon")
if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
  for _, file in ipairs(pfiles) do
    sendDebugMessage ("The file is: "..file)
    local pokemon, load_error = SMODS.load_file("pokemon/"..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      local curr_pokemon = pokemon()
      if curr_pokemon.init then curr_pokemon:init() end
      
      if curr_pokemon.list and #curr_pokemon.list > 0 then
      for i, item in ipairs(curr_pokemon.list) do
        if string.find(item.atlas, "umbr") then
          pokermon.Pokemon(item,"umbr",true)
        else
          pokermon.Pokemon(item,"umbr",false)
          end
        end
      end
    end
  end
end



--Load Debuff logic
local sprite, load_error = SMODS.load_file("functions/functions.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  sprite()
end

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
  if (SMODS.Mods["CardSleeves"] or {}).can_load then
    --Load Sleeves
    local sleeves = NFS.getDirectoryItems(mod_dir.."sleeves")

    for _, file in ipairs(sleeves) do
      sendDebugMessage ("the file is: "..file)
      local sleeve, load_error = SMODS.load_file("sleeves/"..file)
      if load_error then
        sendDebugMessage("The error is: "..load_error)
      else
        local curr_sleeve = sleeve()
        if curr_sleeve.init then curr_sleeve.init() end
        
        for i,item in ipairs (curr_sleeve.list) do
          CardSleeves.Sleeve(item)
        end
      end
    end
  end
end

print("DEBUG: main.lua loaded")

--doesnt work right now, ill figure it out later.
--local function replace_specific_jokers_with_random()