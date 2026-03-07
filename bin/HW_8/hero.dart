import 'game_character.dart';
import 'super_ability.dart';
import 'boss.dart';
import 'rpg_game.dart';

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = (RpgGame.random.nextInt(5) + 2) * damage; // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hits critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      for (var hero in heroes) {
        if (hero.isAlive()) {
          hero.damage += 5;
        }
      }
    }
  }
}

class Medic extends Hero {
  int healPonts;
  Medic(String name, int health, int damage, this.healPonts)
    : super(name, health, damage, SuperAbility.heal);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && this != hero) {
        hero.health += healPonts;
      }
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name is reverted $blockedDamage');
  }
}

class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.block);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    int blocked = (RpgGame.random.nextInt(2) + 1) * 5; //1,2
    for (var hero in heroes) {
      if (hero.isAlive() && this != hero) {
        hero.health += blocked;
      }
    }
    print('Golem $name is blocked $blocked for each hero');
  }
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.luck);
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextInt(100) < 25) {
      this.health += 0;
      print('Lucky ${this.name} dodged the attack!');
    }
  }
}

class Witcher extends Hero {
  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.revival);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    bool resurrectedHero = false;
    if (!resurrectedHero && isAlive()) {
      Hero? deadHeroToSave;
      for (var hero in heroes) {
        if (!hero.isAlive() && hero != this) {
          deadHeroToSave = hero;
          break;
        }
      }
      if (deadHeroToSave != null) {
        deadHeroToSave.health = health;
        health = 0;
        resurrectedHero = true;
      }
    } else {
      print('Witcher ${this.name} failed to revive a hero!');
    }
  }
}

class Thor extends Hero {
  Thor(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.stun);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextInt(100) < 50) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}

class Ludoman extends Hero {
  Ludoman(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.gameBone);

  void applySuperPower(Boss boss, List<Hero> heroes) {
    int gameBone = RpgGame.random.nextInt(6) + 1; // 1-6
    int gameBone1 = RpgGame.random.nextInt(6) + 1; // 1-6
    if (gameBone == gameBone1) {
      boss.health -= gameBone1 * gameBone;
      print('Ludoman $name won the game and hits critically ${gameBone1 * gameBone}!');
    } else {
      int randomIndex = RpgGame.random.nextInt(heroes.length);
      heroes[randomIndex].health -= gameBone1 + gameBone;
      print('Ludoman $name lost the game and hits ${gameBone1 + gameBone} to ${heroes[randomIndex].name}!');
    }
  }

  //   int gameBone = RpgGame.random.nextInt(6) + 1; // 1-6
  //   if (gameBone == gameBone1 || gameBone == gameBone2) {
  //     boss.health -= damage * 2;
  //     print('Ludoman $name won the game and hits critically ${damage * 2}!');
  //   } else {
  //     print('Ludoman $name lost the game and missed the attack!');
  //   }
  // }
}
