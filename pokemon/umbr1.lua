function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

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
    return item_evo(self, card, context, "j_umbr_conkeldurr")
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
-- Axew
local axew={
  name = "axew",       
  poke_custom_prefix = "umbr",
  pos = {x = 4, y = 8},
  config = {extra = {mult = 3, mult_mod = 1}, evo_rqmt = 10},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.evo_reqmt}} 
  end,
  rarity = 1,
  cost = 6,
  stage = "Basic",
  ptype = "Dragon",
  atlas = "Pokedex5",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and context.cardarea == G.jokers and context.scoring_name == "Two Pair" then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
        }
      end
      if context.joker_main and card.ability.extra.mult > 0 then
        return {
          colour = G.C.MULT,
          mult = card.ability.extra.mult
        }
      end
    end
    return scaling_evo(self, card, context, "j_umbr_fraxure", card.ability.extra.mult, self.config.evo_rqmt)
  end,
}
-- Fraxure
local fraxure={
  name = "fraxure",       
  poke_custom_prefix = "umbr",
  pos = {x = 5, y = 8},
  config = {extra = {mult = 10, mult_mod = 3}, evo_rqmt = 25},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.evo_reqmt}} 
  end,
  rarity = 'poke_safari',
  cost = 8,
  stage = "One",
  ptype = "Dragon",
  atlas = "Pokedex5",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and context.cardarea == G.jokers and context.scoring_name == "Two Pair" then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
        }
      end
      if context.joker_main and card.ability.extra.mult > 0 then
        return {
          colour = G.C.MULT,
          mult = card.ability.extra.mult
        }
      end
    end
    return scaling_evo(self, card, context, "j_umbr_haxorus", card.ability.extra.mult, self.config.evo_rqmt)
  end,
}
-- Haxorus
local haxorus={
  name = "haxorus",       
  poke_custom_prefix = "umbr",
  pos = {x = 6, y = 8},
  config = {extra = {mult = 25, mult_mod = 7, mult1 = 0}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, math.max(0, card.ability.extra.mult + card.ability.extra.mult1)}} 
  end,
  rarity = 3,
  cost = 9,
  stage = "Two",
  ptype = "Dragon",
  atlas = "Pokedex5",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint and context.cardarea == G.jokers and context.scoring_name == "Two Pair" then
        card.ability.extra.mult1 = card.ability.extra.mult1 + card.ability.extra.mult_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.MULT,
            card = card
        }
      end
      if context.joker_main and card.ability.extra.mult1 > 0 then
        return {
          colour = G.C.MULT,
          mult = (card.ability.extra.mult + card.ability.extra.mult1)
        }
      end
    end
    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
      if G.GAME.blind.boss and card.ability.extra.mult1 > 0 then
        card.ability.extra.mult1 = 0
        return {
          message = localize('k_reset'),
          colour = G.C.RED
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
  rarity = 'poke_safari',
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
  rarity = 'poke_safari',
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
-- Minior
local minior_shell={
  name = "minior_shell",       
  poke_custom_prefix = "umbr",
  pos = {x = 4, y = 4},
  soul_pos = { x = 5, y = 4},
  config = {extra = {retriggers = 1, levels = 1, odds = 3, boss_quest = 0, ante = 0}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.rounds, card.ability.extra.ante}} 
  end,
  rarity = 3,
  cost = 6,
  stage = "Basic",
  ptype = "Earth",
  atlas = "Pokedex7",
  perishable_compat = true,
  blueprint_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if not context.end_of_round and not context.before and not context.after and G.GAME.current_round.hands_left == 0 then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability.extra.retriggers,
          card = card
        }
      end
    end
    if context.before and context.main_eval and context.scoring_hand and G.GAME.current_round.hands_left == 0 then
        if pseudorandom('minior') < G.GAME.probabilities.normal/card.ability.extra.odds then
        return {
            level_up = true,
            message = localize('k_level_up_ex')
        }
      end
    end
    if context.end_of_round and not context.individual and not context.repetition and G.GAME.blind.boss and G.GAME.round_resets.ante >= card.ability.extra.ante then
      card.ability.extra.boss_quest = card.ability.extra.boss_quest + 1
      return scaling_evo(self, card, context, "j_umbr_minior", card.ability.extra.boss_quest, 1)
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      card.ability.extra.ante = G.GAME.round_resets.ante + 1
    end
  end,
}
local minior={
  name = "minior",       
  poke_custom_prefix = "umbr",
  pos = {x = 4, y = 4},
  soul_pos = { x = math.random(6,12), y = 4},
  config = {extra = {retriggers = 1, levels = 1}},
  no_collection = true,
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.rounds}} 
  end,
  rarity = 'poke_safari',
  cost = 10,
  stage = "Basic",
  ptype = "Earth",
  atlas = "Pokedex7",
  perishable_compat = true,
  blueprint_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
      if not context.end_of_round and not context.before and not context.after and G.GAME.current_round.hands_left == 0 then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability.extra.retriggers,
          card = card
        }
      end
    end
    if context.before and context.main_eval and context.scoring_hand and G.GAME.current_round.hands_left == 0 then
        return {
            level_up = true,
            message = localize('k_level_up_ex')
        }
    end
  end
}
-- Lechonk
local lechonk={
  name = "lechonk",       
  poke_custom_prefix = "umbr",
  pos = {x = 9, y = 0},
  config = {extra = {mult = 5, rounds = 4}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.mult, card.ability.extra.rounds}} 
  end,
  rarity = 1,
  cost = 5,
  stage = "Basic",
  ptype = "Colorless",
  atlas = "Pokedex9",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          colour = G.C.MULT,
          mult = card.ability.extra.mult
        }
      end
    end
    return level_evo(self, card, context, "j_umbr_oinkologne")
  end
}
-- Oinkologne
local oinkologne={
  name = "oinkologne",
  poke_custom_prefix = "umbr",
  pos = {x = 10, y = 0},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    if not card.edition or (card.edition and not card.edition.holo) then
      info_queue[#info_queue+1] = G.P_CENTERS.e_holo
    end
  end,
  rarity = 'poke_safari',
  cost = 7,
  stage = "One",
  ptype = "Colorless",
  atlas = "Pokedex9",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.first_hand_drawn and not context.blueprint then
      local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
      juice_card_until(card, eval, true)
    end
    if context.before and context.cardarea == G.jokers and not context.blueprint and context.scoring_hand then
      if G.GAME.current_round.hands_played == 0 then
        local target = context.scoring_hand[1]
        local args = {edition = "e_holo"}
        poke_convert_cards_to(target, args, true, true)
        return {
                message = localize('umbr_aroma_ex'),
                colour = G.ARGS.LOC_COLOURS["pink"]
            }
        end
      end
    end
}
-- Dondozo
local dondozo={
  name = "dondozo",       
  poke_custom_prefix = "umbr",
  pos = {x = 12, y = 5},
  config = {extra = {chips = 50}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {vars = {card.ability.extra.chips}} 
  end,
  rarity = 3,
  cost = 7,
  stage = "Basic",
  ptype = "Water",
  atlas = "Pokedex9",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.individual and not context.end_of_round and context.cardarea == G.play and not context.other_card.debuff and context.scoring_name == "High Card" then
      return {
        chips = card.ability.extra.chips,
        card = card
      }
      end
    if (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual and not context.blueprint then
      local chosen = nil
      local tatsugiri = {}
        for k, v in pairs(G.jokers.cards) do
          if (v.label == "tatsugiri_droopy" or v.label == "tatsugiri_stretchy" or v.label == "tatsugiri_curly") then
              table.insert(tatsugiri, v)
          end
        end
        if #tatsugiri > 0 then
          chosen = pseudorandom_element(tatsugiri, pseudoseed('dondozo'))
          local edition = {negative = true}
          chosen:set_edition(edition, true)
        end
    end
  end
}
-- Tatsugiri
local tatsugiri_curly={
  name = "tatsugiri_curly",
  poke_custom_prefix = "umbr",
  pos = {x = 13, y = 5},
  config = {extra = {chips = 25}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Joker', key = 'j_splash', config = {} }
    return {vars = {center.ability.extra.chips, center.ability.extra.chips * #find_pokemon_type("Water")}}
  end,
  rarity = 1, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Dragon",
  atlas = "Pokedex9",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        local chips = math.max(0, card.ability.extra.chips * #find_pokemon_type("Water"))
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {chips}}, 
          colour = G.C.CHIPS,
          chip_mod = chips
        }
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      apply_type_sticker(card, "Water")
    end
  end
}
local tatsugiri_droopy={
  name = "tatsugiri_droopy",
  poke_custom_prefix = "umbr",
  pos = {x = 0, y = 6},
  config = {extra = {mult = 5}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Joker', key = 'j_splash', config = {} }
    return {vars = {center.ability.extra.mult, center.ability.extra.mult * #find_pokemon_type("Water")}}
  end,
  rarity = 1, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Dragon",
  atlas = "Pokedex9",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        local mult = math.max(0, card.ability.extra.mult * #find_pokemon_type("Water"))
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {mult}}, 
          colour = G.C.MULT,
          mult_mod = mult
        }
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      apply_type_sticker(card, "Water")
    end
  end
}
local tatsugiri_stretchy={
  name = "tatsugiri_stretchy",
  poke_custom_prefix = "umbr",
  pos = {x = 1, y = 6},
  config = {extra = {money = 2}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Joker', key = 'j_splash', config = {} }
    return {vars = {center.ability.extra.money, center.ability.extra.money * #find_pokemon_type("Water")}}
  end,
  rarity = 1, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Dragon",
  atlas = "Pokedex9",
  blueprint_compat = true,
  calc_dollar_bonus = function(self, card)
    return ease_poke_dollars(card, "tatsugiri_stretchy", math.max(0, card.ability.extra.money * #find_pokemon_type("Water")), true)
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      apply_type_sticker(card, "Water")
    end
  end
}

list = {tropius, timburr, gurdurr, conkeldurr, axew, fraxure, haxorus, swirlix, slurpuff, swirlix_puff, minior_shell, minior, lechonk, oinkologne, dondozo, tatsugiri_curly, tatsugiri_droopy, tatsugiri_stretchy}

return {name = "umbr1",
list = list
}
