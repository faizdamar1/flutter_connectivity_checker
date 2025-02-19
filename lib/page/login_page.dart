import 'package:flutter/material.dart';
import 'package:flutter_connectivity/widget/no_internet_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Stack(
        children: [Center(child: Text("Login Page")), NoInternetWidget()],
      ),
    );
  }
}
