import 'dart:async';

import 'package:flutter/material.dart';

import '../../bloc/cat_breed_bloc.dart';
import '../../bloc/cat_favorite_bloc.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CatBreedBloc _catBloc = CatBreedBloc();
  final CatFavoriteBloc _catFavoriteBloc = CatFavoriteBloc();

  @override
  void initState() {
    super.initState();
    _getCats();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(
          catFavoriteBloc: _catFavoriteBloc,
        ),
      )),
    );
  }

  Future<void> _getCats() async {
    await _catBloc.getCats();
    await _catFavoriteBloc.getFavorites();
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
