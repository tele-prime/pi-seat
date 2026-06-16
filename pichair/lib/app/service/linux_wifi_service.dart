import 'dart:io';
import 'dart:convert';

import 'package:pichair/app/models/wifi_network.dart';

class LinuxWifiService {

  Future<List<WifiNetwork>> scanNetworks() async {
    try {
      await Process.run('nmcli', ['dev', 'wifi', 'rescan']);
    } catch (e) {
      print("Rescan failed or ignored: $e");
    }

    // Allow some time for the scan results to propagate
    await Future.delayed(const Duration(seconds: 6));

    Set<String> activeNames = {};
    try {
      final activeResult = await Process.run('nmcli', ['-t', '-f', 'NAME,TYPE', 'connection', 'show', '--active']);
      if (activeResult.exitCode == 0) {
        final lines = LineSplitter.split(activeResult.stdout.toString());
        for (var line in lines) {
          final parts = line.split(':');
          if (parts.length >= 2 && parts[1] == '802-11-wireless') {
             activeNames.add(parts[0]);
          }
        }
      }
    } catch (_) {}

    try {
      final result = await Process.run('sudo', [
        'nmcli',
        '-t', // Terse mode (script friendly)
        '-f', // Fields
        'SSID,SIGNAL,SECURITY,IN-USE',
        'dev',
        'wifi',
        'list'
      ]);

      if (result.exitCode != 0) {
        throw Exception("Failed to scan: ${result.stderr}");
      }

      final List<WifiNetwork> networks = [];
      final lines = LineSplitter.split(result.stdout.toString());

      final RegExp splitter = RegExp(r'(?<!\\):');

      for (var line in lines) {
        final parts = line.split(splitter);

        if (parts.length < 3) continue;

        final ssid = parts[0].replaceAll(r'\:', ':').trim();
        if (ssid.isEmpty) continue;

        final signal = int.tryParse(parts[1]) ?? 0;

        final isSecure = parts[2].isNotEmpty;

        final isConnected = (parts.length > 3 && parts[3] == '*') || activeNames.contains(ssid);

        final existingIndex = networks.indexWhere((n) => n.ssid == ssid);

        if (existingIndex != -1) {
          if (signal > networks[existingIndex].signalStrength) {
            networks[existingIndex] = WifiNetwork(
              ssid: ssid,
              signalStrength: signal,
              isSecure: isSecure,
              isConnected: isConnected,
            );
          }
        } else {
          networks.add(WifiNetwork(
            ssid: ssid,
            signalStrength: signal,
            isSecure: isSecure,
            isConnected: isConnected,
          ));
        }
      }

      networks.sort((a, b) {
        if (a.isConnected) return -1;
        if (b.isConnected) return 1;
        return b.signalStrength.compareTo(a.signalStrength);
      });

      return networks;
    } catch (e) {
      print("Error scanning wifi: $e");
      return [];
    }
  }

  Future<bool> connectToNetwork(String ssid, String? password) async {
    if (password != null && password.isNotEmpty) {
      try {
        await Process.run('sudo', ['nmcli', 'connection', 'delete', ssid]);
      } catch (_) {}
    }

    List<String> args = ['nmcli', 'dev', 'wifi', 'connect', ssid];

    if (password != null && password.isNotEmpty) {
      args.addAll(['password', password]);
    }
    
    // Explicitly set the connection name to ensure consistency
    args.addAll(['name', ssid]);

    try {
      var result = await Process.run('sudo', args);
      
      // If connection failed, it might be because the network isn't visible in the current scan list.
      // Try scanning again and retrying the connection.
      if (result.exitCode != 0) {
        print("Connect attempt 1 failed: ${result.stderr}. Rescanning and retrying...");
        
        try {
           await Process.run('sudo', ['nmcli', 'dev', 'wifi', 'rescan']);
           await Future.delayed(const Duration(seconds: 5));
        } catch (_) {}

        result = await Process.run('sudo', args);
      }

      if (result.exitCode != 0) {
        print("#### => connect => Error Code: ${result.exitCode}");
      } else {
        print("Connected successfully.");
      }
      print("#### => connect => Status Code: ${result.exitCode}");
      print("#### => connect => Standard Error: ${result.stderr}");
      print("#### => connect => Standard Output: ${result.stdout}");
      return result.exitCode == 0;
    } catch (e) {
      print("Connection error: $e");
      return false;
    }
  }

  Future<bool> disconnectNetwork(String ssid) async {
    try {
      final result = await Process.run('sudo', ['nmcli', 'connection', 'delete', ssid]);
      
      // Error code 10 means "Connection not found", which technically means we are already disconnected.
      if (result.exitCode != 0 && result.exitCode != 10) {
        print("#### => disconnect => Error Code: ${result.exitCode}");
        return false;
      }

      print("#### => disconnect => Result Code: ${result.exitCode}");
      print("#### => disconnect => Standard Error: ${result.stderr}");
      print("#### => disconnect => Standard Output: ${result.stdout}");
      
      print("Disconnected successfully.");
      return true;
    } catch (e) {
      print("Disconnect error: $e");
      return false;
    }
  }
}
