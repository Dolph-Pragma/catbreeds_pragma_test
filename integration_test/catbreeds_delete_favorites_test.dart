import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gatitos_app/main.dart' as app;
import 'package:gatitos_app/ui/pages/favorites_page.dart';

void main() {
  testWidgets("description", (widgetTester) async {
    app.main();
    await widgetTester.pumpAndSettle(const Duration(seconds: 4));

    await widgetTester.tap(find.byKey(const Key('GoToFavoritesButton')));
    await widgetTester.pumpAndSettle();

    //Verificamos
    expect(find.byType(FavoritesPage), findsOneWidget);
    expect(find.byKey(const Key('Card_FavoriteOOD3VXAQn')), findsOneWidget);

    await widgetTester
        .tap(find.byKey(const Key('IconButton_DeleteFavoriteOOD3VXAQn')));
    await widgetTester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.byKey(const Key('Card_FavoriteOOD3VXAQn')), findsNothing);

    await widgetTester.tap(find.byKey(const Key('GoBackIconAppbar')));
    await widgetTester.pumpAndSettle();
  });
}
