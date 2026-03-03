import 'devices.dart';

class SmartSpeaker extends Device {
  int volume;
  SmartSpeaker(String name, {required this.volume}) : super(name);

  @override
  void decrease() {
    if (volume > 0) {
      volume = volume - 5;
      print('Decreasing volume of $name to ${volume} (min 0)');
    }
  }

  @override
  void increase() {
    if (volume < 100) {
      volume = volume + 5;
    }
    print('Increasing volume of $name to ${volume} (max 100)');
  }

  @override
  void turnOff() {
    print('Speaker $name is OFF');
  }

  @override
  void turnOn() {
    print('Speaker $name is ON');
  }

  @override
  void showInfo() {
    print('Device: $name volume: ${volume}');
  }
}
