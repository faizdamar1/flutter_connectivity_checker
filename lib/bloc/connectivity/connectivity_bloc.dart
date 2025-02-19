import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connectivity/bloc/connectivity/connectivity_event.dart';
import 'package:flutter_connectivity/bloc/connectivity/connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityChanged>((event, emit) {
      if (event.connectivityResults.isEmpty ||
          event.connectivityResults.contains(ConnectivityResult.none)) {
        emit(ConnectivityDisconnected());
      } else {
        emit(ConnectivityConnected(event.connectivityResults));
      }
    });
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    List<ConnectivityResult> results;
    try {
      results = await _connectivity.checkConnectivity();
    } catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    add(ConnectivityChanged(results));

    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      add(ConnectivityChanged(results));
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
