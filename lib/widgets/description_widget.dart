import 'package:flutter/material.dart';
import 'package:gatitos_app/models/model_gatitos.dart';

class DescriptionWidget extends StatelessWidget {
  final CatsModel cat;
  const DescriptionWidget({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const styleT = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                    'Origin: ${cat.origin}',
                    style: styleT,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.menu_book_rounded),
                  Text(
                    'Intelligence: ${cat.intelligence}',
                    style: styleT,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.local_fire_department_outlined),
                  Text(
                    'Adaptability: ${cat.adaptability}',
                    style: styleT,
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.timer_sharp),
                  Text(
                    'Life Span: ${cat.lifeSpan}',
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
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
