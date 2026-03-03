import 'devices.dart';

class SmartThermostat extends Device {
  int temperature;
  SmartThermostat(String name, {required this.temperature}) : super(name);

  @override
  void turnOff() {
    print('Thermostat $name is OFF');
  }

  @override
  void turnOn() {
    print('Thermostat $name is ON');
  }

  @override
  void showInfo() {
    print('Device: $name temperature: ${temperature}');
  }
}