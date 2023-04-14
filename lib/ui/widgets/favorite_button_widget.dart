import 'package:flutter/material.dart';

import '../../bloc/cat_favorite_bloc.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({super.key, required this.catImageId});
  final String catImageId;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  final CatFavoriteBloc catFavoriteBloc = CatFavoriteBloc();
  bool isCatFav = true;

  @override
  void initState() {
    super.initState();
    isCatFav = catFavoriteBloc.isCatInFavorites(widget.catImageId);
  }

  @override
  Widget build(BuildContext context) {
    return widget.catImageId.isNotEmpty
        ? ElevatedButton.icon(
            onPressed: () {
              isCatFav = catFavoriteBloc.updateFavoriteCat(widget.catImageId);
              setState(() {});
            },
            icon: isCatFav == false
                ? const Icon(
                    Icons.favorite_border_sharp,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_sharp, color: Colors.red),
            label: isCatFav == false
                ? const Text('  Añade a Favoritos')
                : const Text('  Eliminar de Favoritos'),
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.grey.shade400,
            ),
            child: const Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.not_interested),
                  ),
                  TextSpan(text: '  No disponible'),
                ],
              ),
            ),
          );
  }
}
