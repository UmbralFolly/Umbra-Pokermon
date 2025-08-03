return {
    descriptions = {
        Joker = {
            j_umbr_tropius = {
                name = "Tropius",
                text = {
                  "{C:mult}+#1#{} Mult",
                  "{C:green}#2# in #3#{} for {X:mult,C:white}X#4#{} Mult instead",
                } 
            }, 
            j_umbr_timburr = {
                name = "Timburr",
                text = {
                    "Gains {C:chips}+#2#{} Chips if played", 
                    "hand contains a {C:attention}Full House{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                } 
            }, 
            j_umbr_gurdurr = {
                name = "Gurdurr",
                text = {
                    "Gains {C:chips}+#2#{} Chips and creates a", 
                    "{C:attention}Strength{} if played hand",
                    "contains a {C:attention}Full House{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Linking Cord{C:inactive,s:0.8})",
                } 
            },
            j_umbr_conkeldurr = {
                name = "Conkeldurr",
                text = {
                    "Gains {C:chips}+#2#{} Chips and creates a", 
                    "{C:dark_edition}Negative {C:attention}Strength{} if played",
                    "hand contains a {C:attention}Full House{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                }
            },
            j_umbr_swirlix = {
                name = "Swirlix",
                text = {
                    "{C:attention}Volatile Left",
                    "{C:mult}+#1#{} Mult", 
                    "{C:mult}-4{} Mult for every hand played",
                    "When sold, create a {C:pink}Fairy Energy{}",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)",
                } 
            }, 
            j_umbr_slurpuff = {
                name = "Slurpuff",
                text = {
                    "{C:mult}+#1#{} Mult", 
                    "Gains {C:mult}+#2#{} Mult per {X:pink,C:white}Fairy{} Joker",
                    "you have at end of round",
                    "{br:3}ERROR - CONTACT STEAK",
                    "When you defeat a Boss Blind,",
                    -- "The first time each round you sell a {X:pink,C:white}Fairy{} Joker,",
                    "create a {C:attention}Swirlix Puff{} with {C:dark_edition}Negative{}",
                } 
            }, 
            j_umbr_swirlix_puff = {
                name = "Swirlix Puff",
                text = {
                    "{C:attention}Volatile Left",
                    "{C:mult}+#1#{} Mult", 
                    "{C:mult}-4{} Mult for every hand played",
                    "When sold, create a {C:pink}Fairy Energy{}",
                } 
            },
            j_umbr_minior_shell = {
                name = "Minior",
                text = {
                    "Retrigger all played cards in {C:attention}final hand{} of the round",
                    "{br:3}ERROR - CONTACT STEAK",
                    "{C:green}1 in 4{} chance to upgrade the level of",
                    "{C:attention}final hand{} of the round",
                    "{C:inactive,s:0.8}(Breaks open after defeating the {C:attention,s:0.8}Ante #3#{C:inactive,s:0.8} Boss Blind)",
                }
            },
            j_umbr_minior = {
                name = "Minior",
                text = {
                    "Retrigger all played cards", 
                    "and upgrade the level of",
                    "{C:attention}final hand{} of the round",
                }
            },
            j_umbr_lechonk = {
                name = "Lechonk",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#2#{C:inactive,s:0.8} rounds)",
                }
            },
            j_umbr_oinkologne = {
                name = "Oinkologne",
                text = {
                    "Adds {C:attention}Holographic{} to the",
                    "leftmost scoring card on",
                    "{C:attention}first hand{} of round",
                }
            },
            j_umbr_dondozo = {
                name = "Dondozo",
                text = {
                    "If played hand is a {C:attention}High Card,",
                    "scored cards give {C:chips}+#1#{} Chips", 
                    "{br:3}ERROR - CONTACT STEAK",
                    "When {C:attention}Boss Blind{} is defeated,",
                    "add {C:dark_edition}Negative{} to a random {C:attention}Tatsugiri",
                }
            },
            j_umbr_tatsugiri_curly = {
                name = "Tatsugiri",
                text = {
                    "Applies {C:attention}Splash",
                    "{C:blue}+#1#{} Chips for each",
                    "{X:blue,C:white}Water{} Joker you have",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                }
            },
            j_umbr_tatsugiri_droopy = {
                name = "Tatsugiri",
                text = {
                    "Applies {C:attention}Splash",
                    "{C:red}+#1#{} Mult for each",
                    "{X:blue,C:white}Water{} Joker you have",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_umbr_tatsugiri_stretchy = {
                name = "Tatsugiri",
                text = {
                    "Applies {C:attention}Splash",
                    "Earn {C:attention}$#1#{} for each",
                    "{X:blue,C:white}Water{} Joker you have",
                    "at end of round",
                    "{C:inactive}(Currently {C:attention}$#2#{C:inactive})",
                }
            },
            j_umbr_axew = {
                name = "Axew",
                text = {
                    "Gains {C:red}+#2#{} Mult if played",
                    "hand is a {C:attention}Two Pair",
                    "{C:inactive,s:0.8}(Evolves at {C:red,s:0.8}+#1#{C:inactive,s:0.8} / +10 Mult)",
                }
            },
            j_umbr_fraxure = {
                name = "Fraxure",
                text = {
                    "Gains {C:red}+#2#{} Mult if played",
                    "hand is a {C:attention}Two Pair",
                    "{C:inactive,s:0.8}(Evolves at {C:red,s:0.8}+#1#{C:inactive,s:0.8} / +25 Mult)",
                }
            },
            j_umbr_haxorus = {
                name = "Haxorus",
                text = {
                    "If played hand is a {C:attention}Two Pair{}",
                    "this gains {C:red}+#2#{} Mult, resets to",
                    "{C:red}+#1#{} when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
                }
            },
        },
        Item = {
            c_umbr_terashard = {
                name = "Tera Shard",
                text = {
                    "Convert the leftmost Joker's {C:pink}type{}",
                    "into the selected Joker's {C:pink}type{}",
                }
            },
        },
    },
      misc = {
      dictionary = {
            umbr_swirl_ex = "Swirl!",
            umbr_aroma_ex = "Lingering Aroma!",
            umbr_crab_ex = "Crabhammer!"
      },
   },
}

-- text = {
--     "Played cards with",
--     "{C:diamonds}#3#{} suit give",
--     "{C:mult}+#1#{} Mult and ",
--     "{C:money}$#2#{} when scored",
-- } 