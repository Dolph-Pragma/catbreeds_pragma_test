import 'package:flutter/material.dart';
import 'package:gatitos_app/bloc/cats_bloc.dart';
import 'package:gatitos_app/models/model_gatitos.dart';
import 'package:gatitos_app/widgets/card_cats.dart';
import 'package:gatitos_app/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catbreeds'),
          centerTitle: true,
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        body: const ContainHome());
  }
}

class ContainHome extends StatelessWidget {
  const ContainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchWidget(),
          Expanded(child: CatsListWidget()),
        ],
      ),
    );
  }
}

class CatsListWidget extends StatelessWidget {
  CatsListWidget({super.key});
  final CatBloc _catBloc = CatBloc();

  @override
  Widget build(BuildContext context) {
    List<CatsModel> catsModels = [];
    return StreamBuilder(
      stream: _catBloc.catController.stream,
      builder: (BuildContext context, AsyncSnapshot<List<CatsModel>> snapshot) {
        if (_catBloc.cats.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            catsModels = snapshot.data!;
          } else {
            catsModels = _catBloc.cats;
          }
          return ListView.builder(
              itemCount: catsModels.length,
              itemBuilder: (context, i) => CardsCatsWidget(cat: catsModels[i]));
        }
      },
    );
  }
}
