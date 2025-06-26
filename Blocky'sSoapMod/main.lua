SMODS.Atlas{
    key = 'bluebubbles',
    path = 'bluebubbles.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'bluebubbles',
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    loc_txt = {
        name = 'Blue Bubbles',
        text = {
            '{C:blue}+100{} Chips',
            '{C:green}1 in 3{} chance',
            'this card is',
            '{C:red,E:2}destroyed{} at end',
            'of round'
        }
    },
    atlas = 'bluebubbles',
    pos = {x = 0, y = 0},
    config = { extra = { odds = 3, chips = 100 } },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('bluebubbles') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                G.GAME.pool_flags.bubble_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    in_pool = function(self, args)
        return not G.GAME.pool_flags.bubble_extinct
    end
}

SMODS.Atlas{
    key = 'redbubbles',
    path = 'redbubbles.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'redbubbles',
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 2,
    cost = 5,
    loc_txt = {
        name = 'Red Bubbles',
        text = {
            '{C:red}+100{} Mult',
            '{C:green}1 in 5{} chance',
            'this card is',
            '{C:red,E:2}destroyed{} at end',
            'of round'
        }
    },
    atlas = 'redbubbles',
    pos = {x = 0, y = 0},
    config = { extra = { odds = 5, mult = 100 } },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('redbubbles') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                G.GAME.pool_flags.bubble_extinct = true
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    in_pool = function(self, args)
        return not G.GAME.pool_flags.bubble_extinct
    end
}

SMODS.Atlas{
    key = 'dishsoapblueflavored',
    path = 'dishsoapblueflavored.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'dishsoapblueflavored',
    blueprint_compat = false,
    eternal_compat = true,
    rarity = 3,
    cost = 8,
    loc_txt = {
        name = 'Dishsoap Blue Flavored',
        text = {
            'Creates two',
            '{C:dark_edition}Negative{} Blue Bubbles',
            'Jokers every {C:attention} round{}'
        }
    },
    atlas = 'dishsoapblueflavored',
    pos = {x = 0, y = 0},
            calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card({key = "j_loljk_bluebubbles", edition = 'e_negative'})
            SMODS.add_card({key = "j_loljk_bluebubbles", edition = 'e_negative'})
        end
    end

}

SMODS.Atlas{
    key = 'dishsoapredflavored',
    path = 'dishsoapredflavored.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'dishsoapredflavored',
    blueprint_compat = false,
    eternal_compat = true,
    rarity = 3,
    cost = 8,
    loc_txt = {
        name = 'Dishsoap Red Flavored',
        text = {
            'Creates one',
            '{C:dark_edition}Negative{} Red Bubbles',
            'Joker every {C:attention} round{}'
        }
    },
    atlas = 'dishsoapredflavored',
    pos = {x = 0, y = 0},
            calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card({key = "j_loljk_redbubbles", edition = 'e_negative'})
        end
    end

}

SMODS.Atlas{
    key = 'dishsoapjug',
    path = 'dishsoapjug.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'dishsoapjug',
    blueprint_compat = false,
    eternal_compat = true,
    rarity = 4,
    cost = 10,
    loc_txt = {
        name = 'Dishsoap Jug',
        text = {
            'Creates Two',
            '{C:dark_edition}Negative{} Red Bubbles',
            'and one {C:dark_edition}Negative{} Blue Bubble',
            'every {C:attention} round{}'
        }
    },
    atlas = 'dishsoapjug',
    pos = {x = 0, y = 0},
            calculate = function(self, card, context)
        if context.setting_blind then
            SMODS.add_card({key = "j_loljk_redbubbles", edition = 'e_negative'})
            SMODS.add_card({key = "j_loljk_redbubbles", edition = 'e_negative'})
            SMODS.add_card({key = "j_loljk_bluebubbles", edition = 'e_negative'})
        end
    end

}