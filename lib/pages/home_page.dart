import 'package:flutter/material.dart';
import 'package:gatitos_app/models/model_gatitos.dart';
import 'package:gatitos_app/widgets/card_cats.dart';
import 'package:gatitos_app/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  final List<ModelGatitos> cats;
  const HomePage({Key? key, required this.cats}) : super(key: key);

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
        body: ContainHome(
          cats: cats,
        ));
  }
}

class ContainHome extends StatelessWidget {
  final List<ModelGatitos> cats;
  const ContainHome({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchWidget(cats: cats),
          Expanded(child: _createList()),
        ],
      ),
    );
  }

  _createList() {
    return ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, i) => CardsCatsWidget(cat: cats[i]));
  }
}
