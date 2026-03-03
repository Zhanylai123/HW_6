import 'interfaces.dart';
import 'mixins.dart';

abstract class Device with BatteryPowered implements Switchable {
  final String name;
  Device(this.name);
  void showInfo() {
    print('Device: $name');
  }
}

