import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gatitos_app/ui/pages/details_page.dart';
import 'package:gatitos_app/ui/pages/favorites_page.dart';
import 'package:gatitos_app/ui/pages/home_page.dart';
import 'package:gatitos_app/ui/pages/splash_page.dart';

// import 'package:gatitos_app/ui/widgets/card_cats.dart';
// import 'package:gatitos_app/ui/widgets/custom_fab_widget/custom_expandable_fab_widget.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Testing complete flow of CatBreeds App', (widgetTester) async {
    //Inflamos MaterialApp que contiene nuestra app
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: SplashPage(),
      ),
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 20));

    //Verificamos que se haya cargado automaticamente el HomePage despues de mostrarse el SplashPage
    expect(find.byType(HomePage), findsOneWidget);

    //Se hace tap a gato con id abys para ver detalles
    await widgetTester.tap(find.byKey(const Key('abys')));
    await widgetTester.pumpAndSettle();

    //Se verifica que se haya abierto la pagina de detalles
    expect(find.byType(DetailsPage), findsOneWidget);

    //Regresamos a la pantlla principal con el arrowBack
    await widgetTester.tap(find.byKey(const Key('GoBackIconAppbar')));
    await widgetTester.pumpAndSettle();

    //Verificamos que estemos en el Homepage
    expect(find.byType(HomePage), findsOneWidget);

    // //hacemos tap en el FAB de busqueda
    // await widgetTester.tap(find.byKey(const Key('GoToSearchFAB')));
    // await widgetTester.pumpAndSettle();

    // expect(find.byType(SearchCatWidget), findsOneWidget);

    // await widgetTester.tap(find.byKey(const Key('DropdownSearchForCatBreed')));
    // await widgetTester.pumpAndSettle();

    // // //hacemos tap en la raza deseada
    // // await widgetTester.tap(find.byKey(const Key('DropDownItem_aege')));
    // // await widgetTester.pumpAndSettle();
    // await widgetTester.tap(find.descendant(
    //     of: find.byKey(const Key('DropdownSearchForCatBreed')),
    //     matching: find.byKey(GlobalKey(debugLabel: 'DropdownItem_aege'))));

    // //lo añadimos a favoritos
    // await widgetTester.tap(find.byKey(const Key('AddCatToFavoritesButton')));
    // await widgetTester.pumpAndSettle();

    // await widgetTester.tap(find.byKey(const Key('GoBackIconAppbar')));
    // await widgetTester.pumpAndSettle();

    // //verificamos estar realmente en homepage
    // expect(find.byType(HomePage), findsOneWidget);

    //hacemos tap en el FAB de favoritos para navegar a la pantalla
    await widgetTester.tap(find.byKey(const Key('GoToFavoritesButton')));
    await widgetTester.pumpAndSettle();

    //Verificamos
    expect(find.byType(FavoritesPage), findsOneWidget);

    //Volvemos a Homepage
    await widgetTester.tap(find.byKey(const Key('GoBackIconAppbar')));
    await widgetTester.pumpAndSettle();

    //Hacemos un drag hasta encontrar el gatito con id csho en el ListView
    await widgetTester.dragUntilVisible(
      find.byKey(const Key('mcoo')),
      find.byKey(const Key('listviewCatBreeds')),
      const Offset(0, -900),
    );

    await widgetTester.tap(find.byKey(const Key('mcoo')));
    await widgetTester.pumpAndSettle();

    await widgetTester.dragUntilVisible(
      find.byKey(const Key('AddCatToFavoritesButton')),
      find.byKey(const Key('CatDetailsScrollView')),
      const Offset(0, -200),
    );

    await widgetTester.tap(find.byKey(const Key('AddCatToFavoritesButton')));
    await widgetTester.pumpAndSettle();

    await widgetTester
        .ensureVisible(find.byKey(const Key('GoToFavoritesButton')));

    await widgetTester.tap(find.byKey(const Key('GoToFavoritesButton')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(FavoritesPage), findsOneWidget);

    await widgetTester
        .tap(find.byKey(const Key('IconButton_DeleteFavoriteOOD3VXAQn')));
    await widgetTester.pumpAndSettle();

    expect(find.byKey(const Key('Card_FavoriteoOOD3VXAQn')), findsNothing);

    /////////////////////// expect(find.byType(CustomExpandableFab), findsWidgets);

    // //Hacemos una busqueda especifica por raza del gatito que queremos encontrar
    // //Hacemos tap en el fab expandible
    // await widgetTester.ensureVisible(find.byType(CustomExpandableFab));
    // await widgetTester.pumpAndSettle();
    // await widgetTester.tap(find.byType(CustomExpandableFab));
    // await widgetTester.pumpAndSettle();

    // expect(find.byType(ExpandingActionButtonWidget), findsWidgets);

    //Verificamos que se haya extendido nuestro custom fab
  });
}
