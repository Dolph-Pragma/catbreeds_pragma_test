import 'package:flutter/material.dart';

import '../../bloc/cat_favorite_bloc.dart';
// import '../widgets/custom_fab_widget/custom_expandable_fab_widget.dart';

import '../../bloc/cat_breed_bloc.dart';
import '../../models/cat_model.dart';
import '../widgets/card_cats.dart';
import '../widgets/search_cat_widget.dart';
import 'favorites_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.catFavoriteBloc}) : super(key: key);
  final CatFavoriteBloc catFavoriteBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('♡ Cat Breeds ♡'),
        centerTitle: true,
      ),
      body: const ContainHome(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('GoToSearchFAB'),
            heroTag: 'GoToSearchFAB_heroTag',
            backgroundColor: const Color(0xFFC881F7),
            child: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchCatWidget(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            key: const Key('GoToFavoritesButton'),
            heroTag: 'GoToFavoritesButton_heroTag',
            backgroundColor: const Color(0xFFC881F7),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              catFavoriteBloc.getFavorites();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => FavoritesPage(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class ContainHome extends StatelessWidget {
  const ContainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CatsListWidget(),
    );
  }
}

class CatsListWidget extends StatelessWidget {
  CatsListWidget({super.key});
  final CatBreedBloc _catBloc = CatBreedBloc();

  @override
  Widget build(BuildContext context) {
    List<CatModel> catsModels = [];
    return StreamBuilder(
      stream: _catBloc.catBreedController.stream,
      builder: (BuildContext context, AsyncSnapshot<List<CatModel>> snapshot) {
        if (_catBloc.cats.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            catsModels = snapshot.data!;
          } else {
            catsModels = _catBloc.cats;
          }
          return ListView.builder(
            key: const Key('listviewCatBreeds'),
            itemCount: catsModels.length,
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            itemBuilder: (context, i) => CardsCatsWidget(cat: catsModels[i]),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          );
        }
      },
    );
  }
}
