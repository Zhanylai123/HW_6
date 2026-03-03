import 'devices.dart';
import 'interfaces.dart';
import 'mixins.dart';

class SmartLamp extends Device implements Adjustable {
  int brightness;
  SmartLamp(String name, { required this.brightness}) : super(name);

  @override
  void decrease() {
    if (brightness> 0) {
      brightness = brightness - 10;
    }
    print('Decreasing brightness of $name to ${brightness} (min 0)');
  }

  @override
  void increase() {
    if (brightness! < 100) {
      brightness = brightness! + 10;
    }
    print('Increasing brightness of $name to ${brightness!} (max 100)');
  }

  @override
  void turnOff() {
    print('Lamp $name is OFF');
  }

  @override
  void turnOn() {
    print('Lamp $name is ON');
  }

  @override
  void showInfo() {
    print('Device: $name brightness: ${brightness}');
  }
}
