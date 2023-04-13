import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../bloc/cat_breed_bloc.dart';
import '../../models/cat_model.dart';
import '../pages/details_page.dart';

class SearchCatWidget extends StatelessWidget {
  SearchCatWidget({super.key});
  final CatBreedBloc catBloc = CatBreedBloc();

  @override
  Widget build(BuildContext context) {
    CatModel selectedCat;
    return Dialog(
      insetPadding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 250.0, bottom: 350.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Busca una raza de gato',
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: DropdownSearch<CatModel>(
              items: catBloc.cats,
              itemAsString: (item) => item.name,
              onChanged: (value) {
                if (value != null) {
                  selectedCat = value;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => DetailsPage(
                        cat: selectedCat,
                      ),
                    ),
                  );
                }
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    label: const Text('Razas'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                menuProps: MenuProps(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
