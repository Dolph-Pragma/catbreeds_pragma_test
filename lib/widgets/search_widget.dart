import 'package:flutter/material.dart';

import '../bloc/cats_bloc.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);
  final CatBloc catBloc = CatBloc();

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
                  key: const Key('searchWidgetTextField'),
                  controller: razaCtrl,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      hintText: "Raza del gato"),
                  onChanged: (value) => catBloc.filterCats(value),
                ),
              ),
              const Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}
