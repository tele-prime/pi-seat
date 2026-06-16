class WifiNetwork {
  final String ssid;
  final int signalStrength;
  final bool isSecure;
  final bool isConnected;

  WifiNetwork({
    required this.ssid,
    required this.signalStrength,
    required this.isSecure,
    this.isConnected = false,
  });
}