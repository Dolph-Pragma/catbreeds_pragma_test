import 'package:flutter/material.dart';

class ShowCatImageWidget extends StatelessWidget {
  const ShowCatImageWidget({super.key, required this.catImageUrl});
  final String catImageUrl;

  @override
  Widget build(BuildContext context) {
    return catImageUrl.isEmpty
        ? Image(
            image: const AssetImage(
              'assets/cat.png',
            ),
            height: MediaQuery.of(context).size.height * 0.23,
          )
        : Hero(
            tag: catImageUrl,
            child: FadeInImage(
              height: 200,
              width: double.infinity,
              placeholder: const AssetImage('assets/cat.png'),
              placeholderFit: BoxFit.scaleDown,
              image: NetworkImage(catImageUrl),
              fit: BoxFit.cover,
            ),
          );
  }
}
