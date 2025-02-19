import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {
  final List<ConnectivityResult> connectivityResults;

  ConnectivityConnected(this.connectivityResults);
}

class ConnectivityDisconnected extends ConnectivityState {}
