import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../bloc/cat_favorite_bloc.dart';
import '../../models/favorite_cat_model.dart';
import '../widgets/show_cat_image.dart';
import 'details_page.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final CatFavoriteBloc catFavoriteBloc = CatFavoriteBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
        leading: const GoBackIconWidget(),
      ),
      body: StreamBuilder(
        stream: catFavoriteBloc.streamFavoriteCats,
        builder: (BuildContext context,
            AsyncSnapshot<List<FavoriteCatModel>> snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.3)),
                  itemBuilder: (BuildContext context, int index) {
                    FavoriteCatModel cat = snapshot.data![index];
                    String formattedFavoriteDate =
                        DateFormat.yMMMEd().format(cat.createdAt);
                    return Card(
                      key: Key('Card_Favorite${snapshot.data![index].imageId}'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      elevation: 4.0,
                      child: SizedBox.expand(
                        child: Column(
                          children: [
                            ShowCatImageWidget(
                              catImageUrl: cat.image.url,
                              catId: cat.id.toString(),
                            ),
                            ListTile(
                              title: Text(
                                formattedFavoriteDate,
                                style: const TextStyle(fontSize: 13.0),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              trailing: IconButton(
                                  key: Key(
                                      'IconButton_DeleteFavorite${snapshot.data![index].imageId}'),
                                  onPressed: () {
                                    catFavoriteBloc
                                        .deleteCatFromFavorites(cat.id);
                                  },
                                  icon: const Icon(Icons.delete_sharp)),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
