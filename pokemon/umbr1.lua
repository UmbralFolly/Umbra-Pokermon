function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

-- Corphish
-- Crawdaunt
-- Tropius
local tropius={
  name = "tropius", 
  poke_custom_prefix = "umbr",
  pos = {x = 8, y = 10},
  config = {extra = {mult = 15, Xmult = 2, odds = 3}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.mult, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.Xmult,}}
  end,
  rarity = 2, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Grass",
  atlas = "Pokedex3",
  perishable_compat = true,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        if pseudorandom('tropius') < G.GAME.probabilities.normal/card.ability.extra.odds then
          Xmult = card.ability.extra.Xmult
          return {
              Xmult = card.ability.extra.Xmult
              }
          else local mult = card.ability.extra.mult
          return {
              mult = card.ability.extra.mult
              }
      end
    end
  end
end,
}

-- Timburr 532
local timburr={
  name = "timburr", 
  poke_custom_prefix = "umbr",
  pos = {x = 10, y = 2},
  config = {extra = {chips = 0, chip_mod = 10, rounds = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.rounds}}
  end,
  rarity = 1, 
  cost = 5, 
  stage = "Basic", 
  ptype = "Fighting",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and context.cardarea == G.jokers and next(context.poker_hands['Full House']) then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
        }
      end
      if context.joker_main and card.ability.extra.chips > 0 then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
    return level_evo(self, card, context, "j_umbr_gurdurr")
  end,
}

-- Gurdurr 533
local gurdurr={
  name = "gurdurr", 
  poke_custom_prefix = "umbr",
  pos = {x = 11, y = 2},
  config = {extra = {chips = 0, chip_mod = 15}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
  end,
  rarity = 3, 
  cost = 8, 
  item_req = "linkcable",
  stage = "One", 
  ptype = "Fighting",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and context.cardarea == G.jokers and next(context.poker_hands['Full House']) then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
        }
      end
      if context.joker_main and next(context.poker_hands['Full House']) then
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          return {
            extra = {focus = card, message = localize('k_plus_tarot'), colour = G.C.PURPLE, func = function()
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                  local card_type = 'Tarot'
                  local _card = create_card(card_type,G.consumeables, nil, nil, nil, nil, "c_strength")
                  _card:add_to_deck()
                  G.consumeables:emplace(_card)
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              }))
            end},
          }
        end
      end
      if context.joker_main and card.ability.extra.chips > 0 then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  end,
}

-- Conkeldurr 534
local conkeldurr={
  name = "conkeldurr", 
  poke_custom_prefix = "umbr",
  pos = {x = 12, y = 2},
  config = {extra = {chips = 0, chip_mod = 20}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
  end,
  rarity = 'poke_safari', 
  cost = 10, 
  stage = "Two", 
  ptype = "Fighting",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and context.cardarea == G.jokers and next(context.poker_hands['Full House']) then
        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.CHIPS,
            card = card
        }
      end
      if context.joker_main and next(context.poker_hands['Full House']) then
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          return {
            extra = {focus = card, message = localize('k_plus_tarot'), colour = G.C.PURPLE, func = function()
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                  local card_type = 'Tarot'
                  local _card = create_card(card_type,G.consumeables, nil, nil, nil, nil, "c_strength")
                  local edition = {negative = true}
                  _card:set_edition(edition, true)
                  _card:add_to_deck()
                  G.consumeables:emplace(_card)
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              }))
            end},
          }
        end
      end
      if context.joker_main and card.ability.extra.chips > 0 then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  end,
}

-- Swirlix
local swirlix={
  name = "swirlix",       
  poke_custom_prefix = "umbr",
  pos = {x = 6, y = 2},
  config = {extra = {mult = 20, mult_minus = 4, rounds = 5, triggered = false, volatile = 'left'}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..card.ability.extra.volatile}
    return {vars = {card.ability.extra.mult, card.ability.extra.rounds}} 
  end,
  rarity = 1,
  cost = 5,
  stage = "Basic",
  ptype = "Fairy",
  atlas = "Pokedex6",
  volatile = true,
  blueprint_compat = false,
  eternal_compat = false,
  calculate = function(self, card, context)
    if context.selling_self and not context.blueprint then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          return {
            extra = {focus = card, message = localize('poke_plus_energy'), colour = G.ARGS.LOC_COLOURS.pink, func = function()
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                  local card = create_card('Energy', G.consumeables, nil, nil, nil, nil, 'c_poke_fairy_energy')
                  card:add_to_deck()
                  G.consumeables:emplace(card)
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              }))
            end}}
        end
    if context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
      if context.joker_main and volatile_active(self, card, card.ability.extra.volatile) then
        card.ability.extra.triggered = true
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.RED,
          mult_mod = card.ability.extra.mult
        }
      end
      if card.ability.extra.triggered and context.after and not context.blueprint then
        card.ability.extra.triggered = false
        if card.ability.extra.mult - card.ability.extra.mult_minus <= 0 then 
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                                G.jokers:remove_card(self)
                                card:remove()
                                card = nil
                            return true; end})) 
                    return true
                end
            })) 
            return {
                message = localize('umbr_swirl_ex'),
                colour = G.ARGS.LOC_COLOURS["pink"]
            }
        else
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_minus
            return {
                message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra.mult_minus}},
                colour = G.C.RED
            }
        end
      end
    end
    return level_evo(self, card, context, "j_umbr_slurpuff")
  end,
}

-- Slurpuff
local slurpuff={
  name = "slurpuff",       
  poke_custom_prefix = "umbr",
  pos = {x = 7, y = 2},
  config = {extra = {zmult = 20, mult_mod = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.zmult, card.ability.extra.mult_mod}} 
  end,
  rarity = poke_safari,
  cost = 8,
  stage = "One",
  ptype = "Fairy",
  atlas = "Pokedex6",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = false,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
                return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.zmult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.zmult
                }
        end
    if context.end_of_round and not context.individual and not context.repetition then
                card.ability.extra.zmult = math.max(0, (card.ability.extra.zmult) + (card.ability.extra.mult_mod * #find_pokemon_type("Fairy")))
    end
    if (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual and not context.blueprint then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
              play_sound('negative', 1.5, 0.4)
              local temp_card = {set = "Joker", area = G.jokers, key = "j_umbr_swirlix_puff", no_edition = true}
              local new_card = SMODS.create_card(temp_card)
              new_card:add_to_deck()
              G.jokers:emplace(new_card)
              return true end }))
            end
  end,
}
-- Swirlix Puff
local swirlix_puff={
  name = "swirlix_puff",       
  poke_custom_prefix = "umbr",
  pos = {x = 5, y = 0},
  config = {extra = {mult = 20, mult_minus = 4, triggered = false, volatile = 'left'}},
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..card.ability.extra.volatile}
    return {vars = {card.ability.extra.mult, card.ability.extra.rounds}} 
  end,
  rarity = 1,
  cost = 1,
  stage = "Basic",
  ptype = "Fairy",
  atlas = "umbr_Umbrdex1",
  aux_poke = true,
  volatile = true,
  blueprint_compat = false,
  eternal_compat = false,
  calculate = function(self, card, context)
    if context.selling_self and not context.blueprint then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          return {
            extra = {focus = card, message = localize('poke_plus_energy'), colour = G.ARGS.LOC_COLOURS.pink, func = function()
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                  local card = create_card('Energy', G.consumeables, nil, nil, nil, nil, 'c_poke_fairy_energy')
                  card:add_to_deck()
                  G.consumeables:emplace(card)
                  G.GAME.consumeable_buffer = 0
                  return true
                end
              }))
            end}}
        end
    if context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
      if context.joker_main and volatile_active(self, card, card.ability.extra.volatile) then
        card.ability.extra.triggered = true
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.RED,
          mult_mod = card.ability.extra.mult
        }
      end
      if card.ability.extra.triggered and context.after and not context.blueprint then
        card.ability.extra.triggered = false
        if card.ability.extra.mult - card.ability.extra.mult_minus <= 0 then 
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                                G.jokers:remove_card(self)
                                card:remove()
                                card = nil
                            return true; end})) 
                    return true
                end
            })) 
            return {
                message = localize('umbr_swirl_ex'),
                colour = G.ARGS.LOC_COLOURS["pink"]
            }
        else
            card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_minus
            return {
                message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra.mult_minus}},
                colour = G.C.RED
            }
        end
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      local edition = {negative = true}
      card:set_edition(edition, true, true)
    end
  end
}
-- Binacle
-- Barbaracle
-- Lechonk
-- Oinkologne

list = {tropius, timburr, gurdurr, conkeldurr, swirlix, slurpuff, swirlix_puff}

return {name = "umbr1",
list = list
}
