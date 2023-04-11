import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gatitos_app/bloc/cats_bloc.dart';
import '/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CatBloc _catBloc = CatBloc();

  @override
  void initState() {
    super.initState();
    _getCats();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      )),
    );
  }

  Future<void> _getCats() async {
    await _catBloc.getCats();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "CATBREEDS",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Image(image: AssetImage('assets/logo.png'))
          ],
        ),
      ),
    );
  }
}
