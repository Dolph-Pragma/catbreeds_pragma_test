import 'package:flutter/material.dart';

import '../models/model_gatitos.dart';
import '../pages/details_page.dart';

class SearchWidget extends StatelessWidget {
  final List<ModelGatitos> cats;
  const SearchWidget({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController razaCtrl = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.grey[300]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 200,
                child: TextField(
                  controller: razaCtrl,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      hintText: "Raza del gato"),
                ),
              ),
              IconButton(
                  onPressed: () {
                    for (var cat in cats) {
                      if (cat.name.toLowerCase() ==
                          razaCtrl.text.toLowerCase()) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(cat: cat),
                        ));
                      }
                    }
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
        ),
      ),
    );
  }
}
