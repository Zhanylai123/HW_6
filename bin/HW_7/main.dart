import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';
import 'interfaces.dart';
import 'devices.dart';
import 'mixins.dart';

void main() {
  List<Switchable> devices = [
    SmartLamp('Living Room Lamp', brightness: 50),
    SmartSpeaker('Kitchen Speaker', volume: 15),
    SmartThermostat('Bedroom Thermostat', temperature: 22),
  ];
  for (var device in devices) {
    device.turnOn();
   
    if (device is Adjustable) {
      Adjustable adjustableDevice = device as Adjustable;
      adjustableDevice.increase();
    }
    if (device is BatteryPowered) {
      BatteryPowered batteryDevice = device as BatteryPowered;
      batteryDevice.showBattery();
    }
    device.showInfo();
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  }
  print('All devices processed.');

  // SmartLamp lamp = SmartLamp('Living Room Lamp', brightness: 50);
  // lamp.showInfo();
  // lamp.turnOn();
  // lamp.increase();
  // lamp.decrease();
  // lamp.turnOff();

  // print('~~~~~~~~~~~~~~~~~~~~~~~~~~~');

  // SmartSpeaker speaker = SmartSpeaker('Kitchen Speaker', volume: 15);
  // speaker.showInfo();
  // speaker.turnOn();
  // speaker.increase();
  // speaker.decrease();
  // speaker.turnOff();

  // print('~~~~~~~~~~~~~~~~~~~~~~~~~~~');
}
