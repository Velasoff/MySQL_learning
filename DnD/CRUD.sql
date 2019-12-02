use dnd;

INSERT INTO users(first_name, last_name, gender, birthday, email) VALUES
  ('Nelson', 'Walton', 'M', '19940510', 'crossjason@hotmail.com'),
  ('Logan', 'Ferguson', 'M', '19850831', 'wwatson@short.com'),
  ('Jack', 'Davis', 'M', '19950823', 'qanderson@yahoo.com'),
  ('Erica', 'Hart', 'F', '19990210', 'hernaz@evans-boyd.com'),
  ('Frederick', 'Webb', 'M', '19920131', 'brucekathryn@gmail.com'),
  ('Lesley', 'Campbell', 'F', '19890106', 'ronaldcox@ramsey.com'),
  ('Donald', 'Perkins', 'M', '19870726', 'jyang@wolf.biz'),
  ('Paul', 'Sherman', 'M', '19880422', 'nwoods@floyd.com')
;

INSERT INTO races VALUES
  ('Human', 150, 210, 40,  150, 30),
  ('Elf', 152, 183, 40, 110, 30),
  ('Dwarf', 122, 152, 50, 75, 25),
  ('Half-orc', 150, 210, 40, 160, 30),
  ('Tiefling', 150, 210, 40, 120, 30)
;

INSERT INTO classes VALUES
  ('Barbarian', 7, 80),
  ('Bard', 5, 200),
  ('Cleric', 5, 200),
  ('Druid', 5, 80),
  ('Fighter', 6, 200),
  ('Monk', 5, 20),
  ('Paladin', 6, 200),
  ('Ranger', 6, 200),
  ('Rogue', 5, 160),
  ('Sorcerer', 4, 120),
  ('Warlock', 5, 160),
  ('Wizard', 4, 120)
;

INSERT INTO weapons VALUES
  ('Dagger', 2, 4, 2),
  ('Greatclub', 2, 8, 10),
  ('Javelin', 5, 6, 2),
  ('Mace', 5, 6, 4),
  ('Sickle', 1, 4, 2),
  ('Spear', 1, 6, 3),
  ('Crossbow', 25, 8, 5),
  ('Shortbow', 25, 6, 2),
  ('Battleaxe', 10, 8, 4),
  ('Flail', 10, 8, 2),
  ('Greataxe', 30, 12, 7),
  ('Lance', 10, 12, 6),
  ('Maul', 10, 12, 6),
  ('Trident', 5, 6, 4),
  ('War pick', 5, 8, 2)
;

INSERT INTO armors VALUES
  ('Padded', 5, 11, 0, 'N', 8),
  ('Leather', 10, 11, 0, 'Y', 10),
  ('Studded leather', 45, 12, 0, 'Y', 13),
  ('Hide', 10, 12, 0, 'Y', 12),
  ('Chain shirt', 50, 13, 0, 'Y', 20),
  ('Scale mail', 50, 14, 0, 'N', 45),
  ('Breastplate', 400, 14, 0, 'Y', 20),
  ('Halfplate', 700, 15, 0, 'N', 40),
  ('Ringmail', 30, 14, 0, 'N', 40),
  ('Chain mail', 75, 16, 13, 'N', 55),
  ('Splint', 200, 17, 15, 'N', 60),
  ('Plate', 1500, 18, 15, 'N', 65)
;

INSERT INTO characters (name, height, weight, alignment, id_race, id_class, id_user, id_armors, id_weapons, level, inspiration, hp_max, hp_current, initiative, armor_class, speed, proficiency, perception) VALUES
  ('Braenvan', 150, 58, 1, 'Dwarf', 'Sorcerer', 2, 'Leather', 'Mace', 1, 0, 5, 5, 2, 11, 25, 2, 11),
  ('CurtNunkhuub', 190, 89, 5, 'Human', 'Fighter', 8, 'Ringmail', 'Battleaxe', 1, 0, 7, 7, 2, 11, 30, 2, 11),
  ('Theran', 180, 64, 8, 'Elf', 'Ranger', 1, 'Leather', 'Dagger', 1, 0, 6, 6, 2, 11, 30, 2, 11),
  ('PaoloPahra', 175, 58, 3, 'Human', 'Barbarian', 2, 'Chain mail', 'Greataxe', 1, 0, 7, 7, 2, 11, 30, 2, 11),
  ('ZalthuPelletstasher', 200, 91, 3, 'Half-orc', 'Paladin', 6, 'Plate', 'Trident', 1, 0, 7, 7, 2, 11, 30, 2, 11),
  ('Music', 189, 75, 8, 'Tiefling', 'Warlock', 7, 'Leather', 'Sickle', 1, 0, 5, 5, 2, 11, 30, 2, 11)
;

INSERT INTO spells(name, level, casting_time, ranges, duration, description) VALUES
  ('Acid Splash', 2, '1 action', 60, HOUR(24), 'You hurl a bubble of acid. C hoose one creature within range, or choose two creatures within range that are within 5 feet o f each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage.'),
  ('Animate dead', 3, '1 minute', 10, HOUR(24), 'This spell creates an undead servant. C hoose a pile of bones or a corpse of a M edium or Sm all humanoid within range. Your spell im bues the target with a foul m im icry of life, raising it as an undead creature. The target becom es a skeleton if you chose bones or a zom bie if you chose a corpse (the DM has the creature’s game statistics)'),
  ('Antilife Shell', 5, '1 action', 10, MINUTE(1), 'A shim m ering barrier extends out from you in a 10-foot radius and m oves with you, remaining centered on you and hedging out creatures other than undead and constructs. The barrier lasts for the duration.'),
  ('Arcane Gate', 6, '1 action', 500, MINUTE(10),'You create linked teleportation portals that remain open for the duration. C hoose two points on the ground that you can see, one point within 10 feet of you and one point within 500 feet of you. A circular portal, 10 feet in diameter, opens over each point. If the portal w ould open in the space occupied by a creature, the spell fails, and the casting is lost'),
  ('Astral Projective', 9, '1 hour', 10, HOUR(24), 'You and up to eight willing creatures within range project your astral bodies into the Astral Plane (the spell fails and the casting is wasted if you are already on that plane). The material body you leave behind is u nconscious and in a state of suspended animation; it doesn’t need food or air and doesn’t age')
;

INSERT INTO goods(name, type, description) VALUES
  ('Ring of Mind Shielding', 'Ring', 'While wearing this ring, you are immune to magic that allows other creatures to read your thoughts, determine whether you are lying, know your alignment, or know your creature type. Creatures can telepathically communicate with you only if you allow it.'),
  ('Ring of Evasion', 'Ring', 'This ring has 3 charges, and it regains 1d3 expended charges daily at dawn. When you fail a Dexterity saving throw while wearing it, you can use your reaction to expend 1 of its charges to succeed on that saving throw instead.'),
  ('Spell Scroll, 1 level', 'Spell', 'A spell scroll bears the words of a single spell, written in a mystical cipher. If the spell is on your class''s spell list, you can use an action to read the scroll and cast its spell without having to provide any of the spell''s components. Otherwise, the scroll is unintelligible.'),
  ('Staff of Charming', 'Staff', 'While holding this staff, you can use an action to expend 1 of its 10 charges to cast charm person, command, or comprehend languages from it using your spell save DC. The staff can also be used as a magic quarterstaff.')
;
INSERT INTO goods_own VALUES
  (6, 4),
  (3, 3),
  (2, 1),
  (4, 2)
;

INSERT INTO spells_own VALUES
  (6, 1),
  (6, 2),
  (1, 3),
  (1, 1),
  (1, 5)
;

INSERT INTO wealth(id_char) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6);

INSERT INTO points VALUES
  (1, )
