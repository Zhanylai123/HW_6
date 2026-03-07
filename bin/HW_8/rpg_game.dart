import 'boss.dart';
import 'hero.dart';
import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    Boss boss = Boss('Gaga', 1000, 50);

    Warrior warrior1 = Warrior('Alex', 280, 15);
    Warrior warrior2 = Warrior('Bob', 290, 10);
    Magic magic = Magic('Andrew', 270, 10);
    Medic doc = Medic('Tom', 250, 5, 15);
    Medic assistant = Medic('Strange', 300, 5, 5);
    Berserk berserk = Berserk('Guts', 260, 10);
    Lucky lucky = Lucky('Lucky', 240, 10);
    Golem golem = Golem('Golem', 400, 5);
    Witcher witcher = Witcher('Witcher', 200, 0);
    Thor thor = Thor('Thor', 250, 20);
    Ludoman ludoman = Ludoman('Ludoman', 200, 10);

    List<Hero> heroes = [
      warrior1,
      assistant,
      warrior2,
      magic,
      doc,
      berserk,
      lucky,
      golem,
      witcher,
      thor,
      ludoman
    ];

    _showStatistics(boss, heroes);

    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }

    bool allHeroesDead = true;
    for (var hero in heroes) {
      if (hero.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }

    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }

    return false;
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    if (boss.isStunned == true) {
    } else {
      boss.attack(heroes);
    }
    for (var hero in heroes) {
      if (hero.isAlive() && boss.isAlive() && boss.defence != hero.ability) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }
    }
    _showStatistics(boss, heroes);
  }

  static _showStatistics(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber ----------');
    print(boss);
    for (var hero in heroes) {
      print(hero);
    }
  }
}
