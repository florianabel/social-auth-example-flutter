import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen(
      {Key? key,
      required this.setLoadingState,
      required this.setAuthenticatedState,
      required this.setUnauthenticatedState})
      : super(key: key);

  final VoidCallback setLoadingState;
  final VoidCallback setAuthenticatedState;
  final VoidCallback setUnauthenticatedState;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueAccent,
      child: Center(
        child: ElevatedButton(
          onPressed: loginAction,
          child: const Text('Login'),
        ),
      ),
    );
  }

  Future<void> loginAction() async {
    widget.setLoadingState();
    final authSuccess = await AuthService.instance.login();
    if (authSuccess) {
      widget.setAuthenticatedState();
    } else {
      widget.setUnauthenticatedState();
    }
  }
}