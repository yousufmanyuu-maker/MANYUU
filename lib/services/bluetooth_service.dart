import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  final FlutterBluetoothSerial _bluetoothSerial = FlutterBluetoothSerial.instance;
  StreamSubscription? _discoveryStreamSubscription;
  List<BluetoothDiscoveryResult> discoveredDevices = [];

  Future<void> initBluetooth() async {
    final isEnabled = await _bluetoothSerial.requestEnable();
    if (isEnabled) {
      print('Bluetooth enabled');
    }
  }

  Future<void> startBluetoothScan() async {
    _discoveryStreamSubscription = _bluetoothSerial.startDiscovery().listen((discovery) {
      print('Discovery: ${discovery.device.name} (${discovery.device.address})');
      discoveredDevices.add(discovery);
    });
  }

  Future<void> stopBluetoothScan() async {
    await _discoveryStreamSubscription?.cancel();
    _discoveryStreamSubscription = null;
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      await _bluetoothSerial.bondDeviceAtAddress(device.address);
      print('Connected to ${device.name}');
    } catch (e) {
      print('Connection error: $e');
    }
  }

  Future<void> sendMessage(String message) async {
    try {
      _bluetoothSerial.write(message);
      print('Message sent: $message');
    } catch (e) {
      print('Send error: $e');
    }
  }

  Stream<Uint8List> receiveMessages() {
    return _bluetoothSerial.onRead;
  }

  Future<void> disconnect() async {
    await _bluetoothSerial.disconnect();
    print('Disconnected');
  }

  Future<List<BluetoothDevice>> getBondedDevices() async {
    return await _bluetoothSerial.getBondedDevices();
  }
}