import 'package:flutter/material.dart';
import 'package:flutter_connectivity/page/login_page.dart';
import 'package:flutter_connectivity/page/register_page.dart';
import 'package:flutter_connectivity/widget/no_internet_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connectivity Status')),
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  child: Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
          NoInternetWidget(),
        ],
      ),
    );
  }
}
