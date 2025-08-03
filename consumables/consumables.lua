local terashard = {
    name = "terashard",
    key = "terashard",
    set = "Item",
    loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'typechanger', vars = {"Random Type", colours = {G.ARGS.LOC_COLOURS.pink}}}
    end,
    pos = { x = 0, y = 0 },
    atlas = "umbr_tera_shard",
    cost = 4,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        if G.jokers.highlighted and #G.jokers.highlighted == 1 then
            return true
        end
        return false
    end,
    use = function(self, card, area, copier)
      set_spoon_item(card)
      if G.jokers.highlighted and #G.jokers.highlighted == 1 then
        if has_type(G.jokers.highlighted[1]) then
          apply_type_sticker(G.jokers.cards[1], get_type(G.jokers.highlighted[1]))
          card:juice_up()
          card_eval_status_text(G.jokers.cards[1], 'extra', nil, nil, nil, {message = localize("poke_tera_ex"), colour = G.C.SECONDARY_SET.Spectral})
        end
    end
    in_pool = function(self)
        return true
    end
end
}

local list = {terashard}

return {name = "umbritems",
    list = list
}