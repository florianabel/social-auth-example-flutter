import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
    required this.setUnauthenticatedState,
  }) : super(key: key);

  final VoidCallback setUnauthenticatedState;

  void logout() async {
    final bool isUnauthenticated = await AuthService.instance.logout();
    if (isUnauthenticated) {
      setUnauthenticatedState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Auth App"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Social Auth Application Main Screen"),
            ElevatedButton(onPressed: logout, child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}