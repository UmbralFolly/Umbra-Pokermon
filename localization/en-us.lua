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
        },
    },
      misc = {
      dictionary = {
            umbr_swirl_ex = "Swirl!"
      },
   },
}

-- text = {
--     "Played cards with",
--     "{C:diamonds}#3#{} suit give",
--     "{C:mult}+#1#{} Mult and ",
--     "{C:money}$#2#{} when scored",
-- } 