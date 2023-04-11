import 'package:flutter/material.dart';
import 'package:gatitos_app/models/model_gatitos.dart';
import 'package:gatitos_app/widgets/description_widget.dart';

class DetailsPage extends StatelessWidget {
  final CatsModel cat;
  const DetailsPage({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            key: const Key('detailsPageBackIcon'),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Hero(
                    key: Key('descriptionImg_${cat.id}'),
                    tag: cat.image.id,
                    child: Image(
                      image: NetworkImage(cat.image.url),
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            DescriptionWidget(cat: cat)
          ],
        ),
      ),
    );
  }
}
