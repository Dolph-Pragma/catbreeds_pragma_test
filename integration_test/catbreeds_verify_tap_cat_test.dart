import 'package:flutter/material.dart';
import 'package:gatitos_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:gatitos_app/ui/pages/details_page.dart';
import 'package:gatitos_app/ui/pages/home_page.dart';

void main() {
  testWidgets('Catbreeds verify tap cat test', (widgetTester) async {
    app.main();

    await widgetTester.pumpAndSettle(const Duration(seconds: 4));

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
  });
}
