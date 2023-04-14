import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gatitos_app/main.dart' as app;
import 'package:gatitos_app/ui/widgets/search_cat_widget.dart';

void main() {
  testWidgets('description', (widgetTester) async {
    app.main();
    await widgetTester.pumpAndSettle(const Duration(seconds: 4));

    //hacemos tap en el FAB de busqueda
    await widgetTester.tap(find.byKey(const Key('GoToSearchFAB')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(SearchCatWidget), findsOneWidget);

    await widgetTester.tap(find.byKey(const Key('DropdownSearchForCatBreed')));
    await widgetTester.pumpAndSettle();

    //hacemos tap en la raza deseada
    await widgetTester.tap(find.text('Aegean').last);
    await widgetTester.pumpAndSettle();
  });
}
