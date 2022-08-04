import 'dart:async';

import 'package:flutter/material.dart';
import '/pages/home_page.dart';
import '../services/api_gatitos.dart';
import '../models/model_gatitos.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GatitosProvider catsProvider = GatitosProvider();

  @override
  void initState() {
    _getCats().then((value) => Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(cats: value),
          )),
        ));
    super.initState();
  }

  Future<List<ModelGatitos>> _getCats() async {
    return await catsProvider.getCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
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
