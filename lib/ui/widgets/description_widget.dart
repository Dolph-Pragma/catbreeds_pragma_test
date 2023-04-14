import 'package:flutter/material.dart';

import '../../bloc/cat_breed_bloc.dart';
import '../../bloc/cat_favorite_bloc.dart';
import '../../models/cat_model.dart';
import '../pages/favorites_page.dart';
import 'favorite_button_widget.dart';

class DescriptionWidget extends StatelessWidget {
  DescriptionWidget({Key? key, required this.cat}) : super(key: key);
  final CatModel cat;

  final CatBreedBloc catBloc = CatBreedBloc();

  final CatFavoriteBloc catFavoriteBloc = CatFavoriteBloc();

  @override
  Widget build(BuildContext context) {
    const styleT = TextStyle(fontSize: 18, fontWeight: FontWeight.w300);
    return Expanded(
      child: SingleChildScrollView(
        key: const Key('CatDetailsScrollView'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(cat.description, style: styleT),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(Icons.map_rounded),
                  Text(
                    '  Origin: ${cat.origin}',
                    style: styleT,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.menu_book_rounded),
                  Text(
                    '  Intelligence: ${cat.intelligence}',
                    style: styleT,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.local_fire_department_outlined),
                  Text(
                    '  Adaptability: ${cat.adaptability}',
                    style: styleT,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.timer_sharp),
                  Text(
                    '  Life Span: ${cat.lifeSpan}',
                    style: styleT,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Temperament: ${cat.temperament}',
                style: styleT,
              ),
              FavoriteButtonWidget(
                key: const Key('AddCatToFavoritesButton'),
                catImageId: cat.image.id,
              ),
              ElevatedButton.icon(
                key: const Key('GoToFavoritesButton'),
                onPressed: () {
                  catFavoriteBloc.getFavorites();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => FavoritesPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.pets_rounded),
                label: const Text('  Ver mis favoritos'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
