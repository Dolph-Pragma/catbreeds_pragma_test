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
      insetPadding: MediaQuery.of(context).viewInsets,
      // const EdgeInsets.only(
      //     left: 15.0, right: 15.0, top: 250.0, bottom: 350.0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Busca una raza de gato',
              style: TextStyle(fontSize: 18, height: 5.0),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 18.0),
              child: DropdownSearch<DropdownMenuItem<CatModel>>(
                key: const Key('DropdownSearchForCatBreed'),
                items: catBloc.cats
                    .map(
                      (e) => DropdownMenuItem<CatModel>(
                        key: Key('DropdownItem_${e.id}'),
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList(),
                itemAsString: (item) => item.value!.name,
                onChanged: (selectedItem) {
                  if (selectedItem != null) {
                    selectedCat = selectedItem.value!;
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
                  listViewProps: const ListViewProps(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                  ),
                  showSearchBox: true,
                  menuProps: MenuProps(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
