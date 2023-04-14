import 'package:flutter/material.dart';
// import 'package:gatitos_app/ui/pages/home_page.dart';

import '../../models/cat_model.dart';
import '../widgets/description_widget.dart';

class DetailsPage extends StatelessWidget {
  final CatModel cat;
  const DetailsPage({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(cat.name),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        leading: const GoBackIconWidget(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Hero(
                    key: Key('descriptionImg_${cat.id}'),
                    tag: cat.image.id,
                    child: cat.image.url.isEmpty
                        ? Image(
                            image: const AssetImage(
                              'assets/cat.png',
                            ),
                            height: MediaQuery.of(context).size.height * 0.23,
                          )
                        : Image(
                            image: NetworkImage(cat.image.url),
                            fit: BoxFit.cover,
                          ),
                  )),
            ),
            DescriptionWidget(cat: cat)
          ],
        ),
      ),
    );
  }
}

class GoBackIconWidget extends StatelessWidget {
  const GoBackIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        key: const Key('GoBackIconAppbar'),
        onPressed: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
        icon: const Icon(Icons.arrow_back_ios_new));
  }
}
