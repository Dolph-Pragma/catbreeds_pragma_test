import 'package:flutter/material.dart';

import '../../models/cat_model.dart';
import '../pages/details_page.dart';
import 'show_cat_image.dart';

class CardsCatsWidget extends StatelessWidget {
  final CatModel cat;
  const CardsCatsWidget({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(cat: cat),
          ),
        );
      },
      child: Card(
        key: Key(cat.id),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: double.infinity,
          height: 320,
          child: Column(
            children: [
              ListTile(
                title: Text(cat.name),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ShowCatImageWidget(
                catImageUrl: cat.image.url,
                catId: cat.id,
              ),
              ListTile(
                title: Text(cat.origin),
                trailing: Text("Inteligencia: ${cat.intelligence.toString()}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
