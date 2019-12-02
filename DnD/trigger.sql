use dnd;

DROP TRIGGER IF EXISTS create_char;
CREATE TRIGGER create_char BEFORE INSERT ON characters
  FOR EACH ROW
  BEGIN
    IF NEW.height < (SELECT min_height FROM races WHERE id_race = NEW.id) or NEW.height > (SELECT max_height FROM races WHERE id_race = NEW.id) THEN
      SET NEW.height = ((SELECT min_height FROM races WHERE id_race = NEW.id) + (SELECT max_height FROM races WHERE id_race = NEW.id)) / 2;
    end if;
    IF NEW.weight < (SELECT min_weight FROM races WHERE id_race = NEW.id) or NEW.weight > (SELECT max_weight FROM races WHERE id_race = NEW.id) THEN
      SET NEW.height = ((SELECT min_weight FROM races WHERE id_race = NEW.id) + (SELECT max_weight FROM races WHERE id_race = NEW.id)) / 2;
    end if;
  SET NEW.speed = (SELECT speed FROM races WHERE id_race = NEW.id);
  end;

DROP TRIGGER IF EXISTS create_wealth;
CREATE TRIGGER create_wealth BEFORE INSERT ON wealth
  FOR EACH ROW
  BEGIN
    SET NEW.gold = (SELECT set_wealth FROM classes WHERE (SELECT id_class FROM characters WHERE NEW.id_char = id) = id_class);
  end;
