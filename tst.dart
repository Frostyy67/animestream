//nothing to test rn

import 'dart:io';

final list = [
  {"name": "4-koma", "isAdult": false},
  {"name": "Achromatic", "isAdult": false},
  {"name": "Achronological Order", "isAdult": false},
  {"name": "Acrobatics", "isAdult": false},
  {"name": "Acting", "isAdult": false},
  {"name": "Adoption", "isAdult": false},
  {"name": "Advertisement", "isAdult": false},
  {"name": "Afterlife", "isAdult": false},
  {"name": "Age Gap", "isAdult": false},
  {"name": "Age Regression", "isAdult": false},
  {"name": "Agender", "isAdult": false},
  {"name": "Agriculture", "isAdult": false},
  {"name": "Ahegao", "isAdult": true},
  {"name": "Airsoft", "isAdult": false},
  {"name": "Alchemy", "isAdult": false},
  {"name": "Aliens", "isAdult": false},
  {"name": "Alternate Universe", "isAdult": false},
  {"name": "American Football", "isAdult": false},
  {"name": "Amnesia", "isAdult": false},
  {"name": "Amputation", "isAdult": true},
  {"name": "Anachronism", "isAdult": false},
  {"name": "Anal Sex", "isAdult": true},
  {"name": "Ancient China", "isAdult": false},
  {"name": "Angels", "isAdult": false},
  {"name": "Animals", "isAdult": false},
  {"name": "Anthology", "isAdult": false},
  {"name": "Anthropomorphism", "isAdult": false},
  {"name": "Anti-Hero", "isAdult": false},
  {"name": "Archery", "isAdult": false},
  {"name": "Armpits", "isAdult": true},
  {"name": "Arranged Marriage", "isAdult": false},
  {"name": "Artificial Intelligence", "isAdult": false},
  {"name": "Asexual", "isAdult": false},
  {"name": "Ashikoki", "isAdult": true},
  {"name": "Asphyxiation", "isAdult": true},
  {"name": "Assassins", "isAdult": false},
  {"name": "Astronomy", "isAdult": false},
  {"name": "Athletics", "isAdult": false},
  {"name": "Augmented Reality", "isAdult": false},
  {"name": "Autobiographical", "isAdult": false},
  {"name": "Aviation", "isAdult": false},
  {"name": "Badminton", "isAdult": false},
  {"name": "Band", "isAdult": false},
  {"name": "Bar", "isAdult": false},
  {"name": "Baseball", "isAdult": false},
  {"name": "Basketball", "isAdult": false},
  {"name": "Battle Royale", "isAdult": false},
  {"name": "Biographical", "isAdult": false},
  {"name": "Bisexual", "isAdult": false},
  {"name": "Blackmail", "isAdult": true},
  {"name": "Board Game", "isAdult": false},
  {"name": "Boarding School", "isAdult": false},
  {"name": "Body Horror", "isAdult": false},
  {"name": "Body Swapping", "isAdult": false},
  {"name": "Bondage", "isAdult": true},
  {"name": "Boobjob", "isAdult": true},
  {"name": "Boxing", "isAdult": false},
  {"name": "Boys' Love", "isAdult": false},
  {"name": "Bullying", "isAdult": false},
  {"name": "Butler", "isAdult": false},
  {"name": "Calligraphy", "isAdult": false},
  {"name": "Cannibalism", "isAdult": false},
  {"name": "Card Battle", "isAdult": false},
  {"name": "Cars", "isAdult": false},
  {"name": "Centaur", "isAdult": false},
  {"name": "Cervix Penetration", "isAdult": true},
  {"name": "CGI", "isAdult": false},
  {"name": "Cheerleading", "isAdult": false},
  {"name": "Chibi", "isAdult": false},
  {"name": "Chimera", "isAdult": false},
  {"name": "Chuunibyou", "isAdult": false},
  {"name": "Circus", "isAdult": false},
  {"name": "Class Struggle", "isAdult": false},
  {"name": "Classic Literature", "isAdult": false},
  {"name": "Clone", "isAdult": false},
  {"name": "Coastal", "isAdult": false},
  {"name": "College", "isAdult": false},
  {"name": "Coming of Age", "isAdult": false},
  {"name": "Conspiracy", "isAdult": false},
  {"name": "Cosmic Horror", "isAdult": false},
  {"name": "Cosplay", "isAdult": false},
  {"name": "Crime", "isAdult": false},
  {"name": "Criminal Organization", "isAdult": false},
  {"name": "Crossdressing", "isAdult": false},
  {"name": "Crossover", "isAdult": false},
  {"name": "Cult", "isAdult": false},
  {"name": "Cultivation", "isAdult": false},
  {"name": "Cumflation", "isAdult": true},
  {"name": "Cunnilingus", "isAdult": true},
  {"name": "Cute Boys Doing Cute Things", "isAdult": false},
  {"name": "Cute Girls Doing Cute Things", "isAdult": false},
  {"name": "Cyberpunk", "isAdult": false},
  {"name": "Cyborg", "isAdult": false},
  {"name": "Cycling", "isAdult": false},
  {"name": "Dancing", "isAdult": false},
  {"name": "Death Game", "isAdult": false},
  {"name": "Deepthroat", "isAdult": true},
  {"name": "Defloration", "isAdult": true},
  {"name": "Delinquents", "isAdult": false},
  {"name": "Demons", "isAdult": false},
  {"name": "Denpa", "isAdult": false},
  {"name": "Desert", "isAdult": false},
  {"name": "Detective", "isAdult": false},
  {"name": "DILF", "isAdult": true},
  {"name": "Dinosaurs", "isAdult": false},
  {"name": "Disability", "isAdult": false},
  {"name": "Dissociative Identities", "isAdult": false},
  {"name": "Double Penetration", "isAdult": true},
  {"name": "Dragons", "isAdult": false},
  {"name": "Drawing", "isAdult": false},
  {"name": "Drugs", "isAdult": false},
  {"name": "Dullahan", "isAdult": false},
  {"name": "Dungeon", "isAdult": false},
  {"name": "Dystopian", "isAdult": false},
  {"name": "E-Sports", "isAdult": false},
  {"name": "Economics", "isAdult": false},
  {"name": "Educational", "isAdult": false},
  {"name": "Elf", "isAdult": false},
  {"name": "Ensemble Cast", "isAdult": false},
  {"name": "Environmental", "isAdult": false},
  {"name": "Episodic", "isAdult": false},
  {"name": "Ero Guro", "isAdult": false},
  {"name": "Espionage", "isAdult": false},
  {"name": "Estranged Family", "isAdult": false},
  {"name": "Exhibitionism", "isAdult": true},
  {"name": "Facial", "isAdult": true},
  {"name": "Fairy", "isAdult": false},
  {"name": "Fairy Tale", "isAdult": false},
  {"name": "Family Life", "isAdult": false},
  {"name": "Fashion", "isAdult": false},
  {"name": "Feet", "isAdult": true},
  {"name": "Fellatio", "isAdult": true},
  {"name": "Female Harem", "isAdult": false},
  {"name": "Female Protagonist", "isAdult": false},
  {"name": "Femboy", "isAdult": false},
  {"name": "Femdom", "isAdult": true},
  {"name": "Fencing", "isAdult": false},
  {"name": "Filmmaking", "isAdult": false},
  {"name": "Firefighters", "isAdult": false},
  {"name": "Fishing", "isAdult": false},
  {"name": "Fitness", "isAdult": false},
  {"name": "Flash", "isAdult": false},
  {"name": "Flat Chest", "isAdult": true},
  {"name": "Food", "isAdult": false},
  {"name": "Football", "isAdult": false},
  {"name": "Foreign", "isAdult": false},
  {"name": "Found Family", "isAdult": false},
  {"name": "Fugitive", "isAdult": false},
  {"name": "Full CGI", "isAdult": false},
  {"name": "Full Color", "isAdult": false},
  {"name": "Futanari", "isAdult": true},
  {"name": "Gambling", "isAdult": false},
  {"name": "Gangs", "isAdult": false},
  {"name": "Gender Bending", "isAdult": false},
  {"name": "Ghost", "isAdult": false},
  {"name": "Go", "isAdult": false},
  {"name": "Goblin", "isAdult": false},
  {"name": "Gods", "isAdult": false},
  {"name": "Golf", "isAdult": false},
  {"name": "Gore", "isAdult": false},
  {"name": "Group Sex", "isAdult": true},
  {"name": "Guns", "isAdult": false},
  {"name": "Gyaru", "isAdult": false},
  {"name": "Hair Pulling", "isAdult": true},
  {"name": "Handball", "isAdult": false},
  {"name": "Handjob", "isAdult": true},
  {"name": "Henshin", "isAdult": false},
  {"name": "Heterosexual", "isAdult": false},
  {"name": "Hikikomori", "isAdult": false},
  {"name": "Historical", "isAdult": false},
  {"name": "Homeless", "isAdult": false},
  {"name": "Horticulture", "isAdult": false},
  {"name": "Human Pet", "isAdult": true},
  {"name": "Hypersexuality", "isAdult": true},
  {"name": "Ice Skating", "isAdult": false},
  {"name": "Idol", "isAdult": false},
  {"name": "Incest", "isAdult": true},
  {"name": "Inn", "isAdult": false},
  {"name": "Inseki", "isAdult": true},
  {"name": "Irrumatio", "isAdult": true},
  {"name": "Isekai", "isAdult": false},
  {"name": "Iyashikei", "isAdult": false},
  {"name": "Josei", "isAdult": false},
  {"name": "Judo", "isAdult": false},
  {"name": "Kaiju", "isAdult": false},
  {"name": "Karuta", "isAdult": false},
  {"name": "Kemonomimi", "isAdult": false},
  {"name": "Kids", "isAdult": false},
  {"name": "Kingdom Management", "isAdult": false},
  {"name": "Konbini", "isAdult": false},
  {"name": "Kuudere", "isAdult": false},
  {"name": "Lacrosse", "isAdult": false},
  {"name": "Lactation", "isAdult": true},
  {"name": "Language Barrier", "isAdult": false},
  {"name": "Large Breasts", "isAdult": true},
  {"name": "LGBTQ+ Themes", "isAdult": false},
  {"name": "Lost Civilization", "isAdult": false},
  {"name": "Love Triangle", "isAdult": false},
  {"name": "Mafia", "isAdult": false},
  {"name": "Magic", "isAdult": false},
  {"name": "Mahjong", "isAdult": false},
  {"name": "Maids", "isAdult": false},
  {"name": "Makeup", "isAdult": false},
  {"name": "Male Harem", "isAdult": false},
  {"name": "Male Pregnancy", "isAdult": true},
  {"name": "Male Protagonist", "isAdult": false},
  {"name": "Marriage", "isAdult": false},
  {"name": "Martial Arts", "isAdult": false},
  {"name": "Masochism", "isAdult": true},
  {"name": "Masturbation", "isAdult": true},
  {"name": "Matriarchy", "isAdult": false},
  {"name": "Medicine", "isAdult": false},
  {"name": "Memory Manipulation", "isAdult": false},
  {"name": "Mermaid", "isAdult": false},
  {"name": "Meta", "isAdult": false},
  {"name": "MILF", "isAdult": true},
  {"name": "Military", "isAdult": false},
  {"name": "Mixed Gender Harem", "isAdult": false},
  {"name": "Monster Boy", "isAdult": false},
  {"name": "Monster Girl", "isAdult": false},
  {"name": "Mopeds", "isAdult": false},
  {"name": "Motorcycles", "isAdult": false},
  {"name": "Mountaineering", "isAdult": false},
  {"name": "Musical", "isAdult": false},
  {"name": "Mythology", "isAdult": false},
  {"name": "Nakadashi", "isAdult": true},
  {"name": "Natural Disaster", "isAdult": false},
  {"name": "Necromancy", "isAdult": false},
  {"name": "Nekomimi", "isAdult": false},
  {"name": "Netorare", "isAdult": true},
  {"name": "Netorase", "isAdult": true},
  {"name": "Netori", "isAdult": true},
  {"name": "Ninja", "isAdult": false},
  {"name": "No Dialogue", "isAdult": false},
  {"name": "Noir", "isAdult": false},
  {"name": "Non-fiction", "isAdult": false},
  {"name": "Nudity", "isAdult": false},
  {"name": "Nun", "isAdult": false},
  {"name": "Office", "isAdult": false},
  {"name": "Office Lady", "isAdult": false},
  {"name": "Oiran", "isAdult": false},
  {"name": "Ojou-sama", "isAdult": false},
  {"name": "Omegaverse", "isAdult": true},
  {"name": "Orphan", "isAdult": false},
  {"name": "Otaku Culture", "isAdult": false},
  {"name": "Outdoor", "isAdult": false},
  {"name": "Pandemic", "isAdult": false},
  {"name": "Parkour", "isAdult": false},
  {"name": "Parody", "isAdult": false},
  {"name": "Pet Play", "isAdult": true},
  {"name": "Philosophy", "isAdult": false},
  {"name": "Photography", "isAdult": false},
  {"name": "Pirates", "isAdult": false},
  {"name": "Poker", "isAdult": false},
  {"name": "Police", "isAdult": false},
  {"name": "Politics", "isAdult": false},
  {"name": "Polyamorous", "isAdult": false},
  {"name": "Post-Apocalyptic", "isAdult": false},
  {"name": "POV", "isAdult": false},
  {"name": "Pregnant", "isAdult": true},
  {"name": "Primarily Adult Cast", "isAdult": false},
  {"name": "Primarily Animal Cast", "isAdult": false},
  {"name": "Primarily Child Cast", "isAdult": false},
  {"name": "Primarily Female Cast", "isAdult": false},
  {"name": "Primarily Male Cast", "isAdult": false},
  {"name": "Primarily Teen Cast", "isAdult": false},
  {"name": "Prison", "isAdult": false},
  {"name": "Prostitution", "isAdult": true},
  {"name": "Proxy Battle", "isAdult": false},
  {"name": "Public Sex", "isAdult": true},
  {"name": "Puppetry", "isAdult": false},
  {"name": "Rakugo", "isAdult": false},
  {"name": "Rape", "isAdult": true},
  {"name": "Real Robot", "isAdult": false},
  {"name": "Rehabilitation", "isAdult": false},
  {"name": "Reincarnation", "isAdult": false},
  {"name": "Religion", "isAdult": false},
  {"name": "Revenge", "isAdult": false},
  {"name": "Rimjob", "isAdult": true},
  {"name": "Robots", "isAdult": false},
  {"name": "Rotoscoping", "isAdult": false},
  {"name": "Royal Affairs", "isAdult": false},
  {"name": "Rugby", "isAdult": false},
  {"name": "Rural", "isAdult": false},
  {"name": "Sadism", "isAdult": true},
  {"name": "Samurai", "isAdult": false},
  {"name": "Satire", "isAdult": false},
  {"name": "Scat", "isAdult": true},
  {"name": "School", "isAdult": false},
  {"name": "School Club", "isAdult": false},
  {"name": "Scissoring", "isAdult": true},
  {"name": "Scuba Diving", "isAdult": false},
  {"name": "Seinen", "isAdult": false},
  {"name": "Sex Toys", "isAdult": true},
  {"name": "Shapeshifting", "isAdult": false},
  {"name": "Ships", "isAdult": false},
  {"name": "Shogi", "isAdult": false},
  {"name": "Shoujo", "isAdult": false},
  {"name": "Shounen", "isAdult": false},
  {"name": "Shrine Maiden", "isAdult": false},
  {"name": "Skateboarding", "isAdult": false},
  {"name": "Skeleton", "isAdult": false},
  {"name": "Slapstick", "isAdult": false},
  {"name": "Slavery", "isAdult": false},
  {"name": "Snowscape", "isAdult": false},
  {"name": "Software Development", "isAdult": false},
  {"name": "Space", "isAdult": false},
  {"name": "Space Opera", "isAdult": false},
  {"name": "Spearplay", "isAdult": false},
  {"name": "Squirting", "isAdult": true},
  {"name": "Steampunk", "isAdult": false},
  {"name": "Stop Motion", "isAdult": false},
  {"name": "Succubus", "isAdult": false},
  {"name": "Suicide", "isAdult": false},
  {"name": "Sumata", "isAdult": true},
  {"name": "Sumo", "isAdult": false},
  {"name": "Super Power", "isAdult": false},
  {"name": "Super Robot", "isAdult": false},
  {"name": "Superhero", "isAdult": false},
  {"name": "Surfing", "isAdult": false},
  {"name": "Surreal Comedy", "isAdult": false},
  {"name": "Survival", "isAdult": false},
  {"name": "Sweat", "isAdult": true},
  {"name": "Swimming", "isAdult": false},
  {"name": "Swordplay", "isAdult": false},
  {"name": "Table Tennis", "isAdult": false},
  {"name": "Tanks", "isAdult": false},
  {"name": "Tanned Skin", "isAdult": false},
  {"name": "Teacher", "isAdult": false},
  {"name": "Teens' Love", "isAdult": false},
  {"name": "Tennis", "isAdult": false},
  {"name": "Tentacles", "isAdult": true},
  {"name": "Terrorism", "isAdult": false},
  {"name": "Threesome", "isAdult": true},
  {"name": "Time Loop", "isAdult": false},
  {"name": "Time Manipulation", "isAdult": false},
  {"name": "Time Skip", "isAdult": false},
  {"name": "Tokusatsu", "isAdult": false},
  {"name": "Tomboy", "isAdult": false},
  {"name": "Torture", "isAdult": false},
  {"name": "Tragedy", "isAdult": false},
  {"name": "Trains", "isAdult": false},
  {"name": "Transgender", "isAdult": false},
  {"name": "Travel", "isAdult": false},
  {"name": "Triads", "isAdult": false},
  {"name": "Tsundere", "isAdult": false},
  {"name": "Twins", "isAdult": false},
  {"name": "Unrequited Love", "isAdult": false},
  {"name": "Urban", "isAdult": false},
  {"name": "Urban Fantasy", "isAdult": false},
  {"name": "Vampire", "isAdult": false},
  {"name": "Veterinarian", "isAdult": false},
  {"name": "Video Games", "isAdult": false},
  {"name": "Vikings", "isAdult": false},
  {"name": "Villainess", "isAdult": false},
  {"name": "Virginity", "isAdult": true},
  {"name": "Virtual World", "isAdult": false},
  {"name": "Volleyball", "isAdult": false},
  {"name": "Vore", "isAdult": true},
  {"name": "Voyeur", "isAdult": true},
  {"name": "VTuber", "isAdult": false},
  {"name": "War", "isAdult": false},
  {"name": "Watersports", "isAdult": true},
  {"name": "Werewolf", "isAdult": false},
  {"name": "Witch", "isAdult": false},
  {"name": "Work", "isAdult": false},
  {"name": "Wrestling", "isAdult": false},
  {"name": "Writing", "isAdult": false},
  {"name": "Wuxia", "isAdult": false},
  {"name": "Yakuza", "isAdult": false},
  {"name": "Yandere", "isAdult": false},
  {"name": "Youkai", "isAdult": false},
  {"name": "Yuri", "isAdult": false},
  {"name": "Zombie", "isAdult": false},
  {"name": "Zoophilia", "isAdult": true}
];

void main() {
  final filter = list.map((e) {

    final bool condition = e['isAdult'] as bool;
    if (!condition) return '"${e['name']}"';
  }).toList();
  print(filter);
  File('./tags.txt').writeAsString(filter.toString().replaceAll("null,", ""));
}
