import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_connectivity/bloc/connectivity/connectivity_bloc.dart';
import 'package:flutter_connectivity/bloc/connectivity/connectivity_state.dart';

class NoInternetWidget extends StatefulWidget {
  const NoInternetWidget({super.key});

  @override
  State<NoInternetWidget> createState() => _NoInternetWidgetState();
}

class _NoInternetWidgetState extends State<NoInternetWidget> {
  bool _isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityDisconnected && !_isDialogOpen) {
          _isDialogOpen = true;
          _showNoInternetDialog(context);
        } else if (state is ConnectivityConnected && _isDialogOpen) {
          Navigator.of(context, rootNavigator: true).pop();
          _isDialogOpen = false;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text("No Internet"),
            content: const Text(
              "You are not connected to the internet. Please check your connection.",
            ),
          ),
        );
      },
    );
  }
}
