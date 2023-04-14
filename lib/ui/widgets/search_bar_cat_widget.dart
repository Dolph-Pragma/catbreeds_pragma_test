// import 'package:flutter/material.dart';
// import 'package:gatitos_app/bloc/cat_breed_bloc.dart';
// import 'package:gatitos_app/models/cat_model.dart';

// import '../pages/details_page.dart';

// class SearchBarCatWidget extends StatelessWidget {
//   const SearchBarCatWidget({super.key, required this.catBreedBloc});
//   final CatBreedBloc catBreedBloc;

//   @override
//   Widget build(BuildContext context) {
//     return Autocomplete<CatModel>(
//       // optionsBuilder: (textEditingValue) {
//       //   if (textEditingValue.text.isEmpty) {
//       //     return const Iterable.empty();
//       //   } else {
//       //     List<String> matches = catBreedBloc.cats.map((e) => e.name).toList();
//       //     matches.retainWhere((element) => element
//       //         .toLowerCase()
//       //         .contains(textEditingValue.text.toLowerCase()));

//       //     return matches;
//       //   }
//       // },
//       // fieldViewBuilder:
//       //     (context, textEditingController, focusNode, onFieldSubmitted) {
//       //   return TextField(
//       //     decoration: InputDecoration(
//       //         border: OutlineInputBorder(
//       //           borderRadius: BorderRadius.circular(25.0),
//       //         ),
//       //         hintText: 'Ingrese raza a buscar'),
//       //     controller: textEditingController,
//       //     focusNode: focusNode,
//       //     onSubmitted: (value) {},
//       //   );
//       // },
//       // optionsViewBuilder: (context, onSelected, options) {
//       // return Material(
//       //   clipBehavior: Clip.hardEdge,
//       //   elevation: 4.0,
//       //   child: SizedBox(
//       //       height: 10,
//       //       child: ListView.builder(
//       //         itemCount: options.length,
//       //         itemBuilder: (BuildContext context, int index) {
//       //           return GestureDetector(
//       //             onTap: () {
//       //               onSelected(options.elementAt(index));
//       //             },
//       //             child: Text(options.elementAt(index)),
//       //           );
//       //         },
//       //       )),
//       // );
//       // },

//       optionsBuilder: (TextEditingValue textEditingValue) {
//         if (textEditingValue.text.isEmpty) {
//           return const Iterable.empty();
//         } else {
//           List<CatModel> matches = catBreedBloc.cats;
//           matches.retainWhere((element) => element.name
//               .toLowerCase()
//               .contains(textEditingValue.text.toLowerCase()));

//           return matches;
//         }
//       },
//       onSelected: (option) {
//         debugPrint('entroErrro');
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (BuildContext context) => DetailsPage(
//         //       cat: option,
//         //     ),
//         //   ),
//         // );
//       },
//       // optionsViewBuilder: (context, onSelected, options) {
//       //   return Scaffold(
//       //     backgroundColor: const Color.fromARGB(0, 255, 255, 255),
//       //     body: Padding(
//       //       padding: const EdgeInsets.symmetric(horizontal: 25),
//       //       child: ListView.builder(
//       //         itemCount: options.length,
//       //         itemBuilder: (BuildContext context, int index) {
//       //           return Container(
//       //             key: Key('SiFuncionaMeMato_${options.elementAt(index)}'),
//       //             color: Colors.white,
//       //             padding:
//       //                 const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//       //             child: GestureDetector(
//       //               onTap: () {
//       //                 onSelected(options.elementAt(index));
//       //               },
//       //               child: Text(options.elementAt(index).name),
//       //             ),
//       //           );
//       //         },
//       //       ),
//       //     ),
//       //   );
//       // },
//     );
//   }
// }
