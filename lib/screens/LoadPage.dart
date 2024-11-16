import 'dart:async';
import 'package:emol/screens/HomePage.dart';
import 'package:emol/screens/LoginPage.dart';
import 'package:emol/utils/Menu.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? id = prefs.getString('quartier');
    // final String? token = prefs.getString('token');
    await Future.delayed(const Duration(seconds: 10));
   
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFF7701),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: const Image(
                  image: AssetImage('assets/logo/logo.jpeg'),
                ),
              ),
              const SizedBox(height: 20), // Espacement
            ],
          ),
        ),
      ),
    );
  }
}