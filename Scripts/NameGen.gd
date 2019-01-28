extends Node

#Epic (Tier) cleaving (Attack Speed) broadsword (Asset) of magnitude (random)

var Tiers = [["Rusty",  "Old",  "Previously Used",  "Ancient",  "Broken",  "Fossil",  "Tired",  "Senile",  "Taped",  "Smelly",  "Bone carved",  "Bankrupt",  "Dirty",  "Strapped",  "Insolvent",  "Filthy",  "Messy",  "Muddy",  "Polluted", "Foul"],
 ["Inactive", "Mature", "Unwashed", "Veteran", "Common", "Fishy", "Improvised", "Overused", "Standard", "Hard Cooked", "Interesting", "Nice", "Fair"],
 ["Okayish", "Artificial", "Spotless", "Intermediate", "Elbish", "Large", "Passable", "Stainless", "Elegant", "Tidy", "Padded", "Sturdy", "Polite", "Great", "Doped"],
 ["Curious", "Orkish", "Well shaped", "Hardened", "Improved", "Good Mannered", "Greater", "Neat", "Marvelous", "Satisfying"],
 ["Superior", "Sharpened", "Polished", "Shiny", "Daedric", "Splendid", "Glamorous", "Ebony", "Worthy"],
 ["Epic", "Dragonborn", "Legendary", "Heroic", "Excellent", "Wonderful", "Enlarged"]]

var Randoms = ["of Greater Wisdom",
 " of Infinit Power",
 " of Doom",
 " of Swiftness",
 " of Epic Armor",
 " of Resistance",
 " of Greater Charisma",
 " of Great Stealth",
 " of Gainful Conjuration",
 " of Infinite Pleasures",
 " of Dripping Water",
 " of Silver Magic",
 " of Lesser Attention",
 " of Minor Usability",
 " of Less Benefit",
 " of Forgot What It Did",
 " of Defined Muscles",
 " of the Firefighter",
 " of the Policeman",
 " of the Ancient Gods",
 " of the Tiny Frog",
 " of the North",
 " of True Blood",
 " of Sinister Hopes",
 " of Dark Woods",
 " of Silly Ideas",
 " of Missing Manual",
 " of No Connection",
 " without a Doubt",
 " of the Master",
 " of Teengirls",
 " of Mutants",
 " of Sweeter Sugars",
 " of Doomification",
 " of the Winds",
 " of Wikings",
 " the Slayer of Infants",
 " of Faults",
 " of Spirit",
 " of Bears Strength",
 " of Shakespear",
 " of Balou",
 " of the Realms",
 " of Plotholes",
 " of Scafriciation",
 " of Fruit Juice",
 " of Fresh Blood",
 " of Moon Moon",
 " Property of God",
 " of Destructiveness ",
 " of Unsure",
 " of being Alone",
 " of Heavy Breathing",
 " of Dead Parents",
 " of the Cute Puppy",
 " of the Internet",
 " of Nine Gags",
 " of Flatulence",
 " of Farting Fathers",
 " of Deep Space",
 " of the Sea",
 " of the Pidgeon",
 ", Bearer of Burdens",
 ", Father of Many",
 ", Bringer of Pain",
 ", Slaughter of Hopes",
 ", Joker of Movies",
 ", Sleight of Hands",
 ", Killer of Kings",
 ", Robber of Banks",
 ", Mother of Nature",
 ", the One and Only",
 ", the True One",
 ", the Complicated",
 ", the Forbidden",
 ", Quitter of Games",
 ", Bringer of Party",
 ", Drinker of Whisky",
 ", Macho of the Year",
 ", Penguin",
 ", Second to None",
 ", Primed with Sealant",
 ", Carrier of Water",
 ", Farting Loudly",
 ", Shamane of Tribes",
 ", Burden of the Wards",
 ", Partyking",
 ", Hero of the Universe","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""] 
