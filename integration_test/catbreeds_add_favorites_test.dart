import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gatitos_app/main.dart' as app;
import 'package:gatitos_app/ui/pages/favorites_page.dart';

void main() {
  testWidgets('description', (widgetTester) async {
    app.main();
    await widgetTester.pumpAndSettle(const Duration(seconds: 4));
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
    expect(find.byKey(const Key('Card_FavoriteOOD3VXAQn')), findsOneWidget);
  });
}
