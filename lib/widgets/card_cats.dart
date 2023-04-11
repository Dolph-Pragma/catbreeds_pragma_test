import 'package:flutter/material.dart';
import 'package:gatitos_app/models/model_gatitos.dart';
import 'package:gatitos_app/pages/details_page.dart';

class CardsCatsWidget extends StatelessWidget {
  final CatsModel cat;
  const CardsCatsWidget({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(cat: cat),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: SizedBox(
          width: double.infinity,
          height: 320,
          child: Column(
            children: [
              ListTile(
                title: Text(cat.name),
                trailing: const Text("mas..."),
              ),
              cat.image.url.isEmpty
                  ? const Image(image: AssetImage('assets/logo.png'))
                  : Hero(
                      key: Key(cat.id),
                      tag: cat.image.id,
                      child: FadeInImage(
                        height: 200,
                        width: double.infinity,
                        placeholder: const AssetImage('assets/logo.png'),
                        image: NetworkImage(cat.image.url),
                        fit: BoxFit.cover,
                      ),
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
