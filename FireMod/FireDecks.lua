--- STEAMODDED HEADER
--- MOD_NAME: FireDecks
--- MOD_ID: FireDecks
--- MOD_AUTHOR: [QRSFirestorm]
--- MOD_DESCRIPTION: This mod adds brand new decks to balatro!

----------------------------------------------
------------MOD CODE -------------------------
SMODS.Atlas {
    key = "fire_backs_atlas",
    px = 71,
    py = 95,
    path = "FireDeckPlaceholder.png"
}

SMODS.Back{
    name = "Soul Deck",
    loc_txt = {
        name = 'Soul Deck',
        text = {
            "Start with a {C:spectral,T:c_Soul}Soul{} card",
            "Start with {C:red}-25{} dollars"
        }
    },
    key = "souldeck",
    pos = {x = 0, y = 0},
    config = {
        dollars = -29,
        consumables = {'c_soul'}
    },
    unlocked = true,
    discovered = true,
}

SMODS.Back{
    name = "PhotoChad Deck",
    loc_txt = {
        name = 'PhotoChad Deck',
        text = {
        "Start with an {C:purple}Eternal{} PhotoChad",
        "Ante Scales {C:red}2.5x{} faster"
        },
    },
    key = 'photodeck',
    pos = {x= 0, y = 0},
    config = {
        ante_scaling = 2.5,
    },
    unlocked = true,
    discovered = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local cards_list = {'hanging_chad', 'photograph'}
                for k,v in pairs(cards_list) do
                    local card = SMODS.create_card({
                        set = 'Joker',
                        area = G.jokers,
                        skip_materialize = true,
                        key = 'j_' .. v,
                        no_edition = true
                    })
                    card:set_eternal(true)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                end
                return true
            end
        }))
    end,
}

SMODS.Back{
    name = "Tax Deck",
    loc_txt = {
        name = 'Tax Deck',
        text = {
            "Lose {C:red}$2{} per remaining hand",
            "Lose {C:red}$1{} per remaining discard",
            "Start with {C:attention}$25{}"
        },
    },
    key = 'taxdeck',
    pos = {x = 0, y = 0},
    config = {
        dollars = 21,
        extra_hand_bonus = -2,
        extra_discard_bonus = -1,
    },
    unlocked = true,
    discovered = true,
}
SMODS.Back{
    name = "Greedy Deck",
    loc_txt = {
        name = 'Greedy Deck',
        text = {
            "Start with {C:attention}$100{}",
            "Start with {C:blue}Seed Money{} and {C:blue}Money Tree{}",
            "{C:blue}Chips{} and {C:red}Mult{} are {C:red}halved{}",
            "Ante Scaling Reduced to {C:red}0.8x{}",
            "Lose {C:red}1{} Joker slot"
        },
    },
    key = 'greedDeck',
    pos = {x = 0, y = 0},
    config = {
        dollars = 96,
        vouchers = {'v_seed_money', 'v_money_tree'},
        ante_scaling = 0.8,
        joker_slot = -1,
    },
    unlocked = true,
    discovered = true,
    calculate = function(self, back, context)
        if context.context == 'final_scoring_step' then
            context.chips = context.chips/2
            context.mult = context.mult/2
            update_hand_text({delay = 0}, {mult = context.mult, chips = context.chips})
        end
        return context.chips, context.mult
    end
}
SMODS.Back{
    name = "V1.0 Mega Deck",
    loc_txt = {
        name = 'V1.0 Mega Deck',
        text = {
            "Combines all {C:green}buffs{} and {C:red}debuffs{}",
            "of every deck released in {C:purple}v1.0{}"
        },
    },
    key = 'megadeck1',
    pos = {x = 0, y = 0},
    config = {
        dollars = 88,
        vouchers = {'v_seed_money', 'v_money_tree'},
        ante_scaling = 2.3,
        consumables = {'c_soul'},
        extra_hand_bonus = -2,
        extra_discard_bonus = -1,
        joker_slot = -1,
    },
    unlocked = true,
    discovered = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local cards_list = {'hanging_chad', 'photograph'}
                for k,v in pairs(cards_list) do
                    local card = SMODS.create_card({
                        set = 'Joker',
                        area = G.jokers,
                        skip_materialize = true,
                        key = 'j_' .. v,
                        no_edition = true
                    })
                    card:set_eternal(true)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                end
                return true
            end
        }))
    end,
    calculate = function(self, back, context)
        if context.context == 'final_scoring_step' then
            context.chips = context.chips/2
            context.mult = context.mult/2
            update_hand_text({delay = 0}, {mult = context.mult, chips = context.chips})
        end
        return context.chips, context.mult
    end
}
----------------------------------------------
------------MOD CODE END----------------------
