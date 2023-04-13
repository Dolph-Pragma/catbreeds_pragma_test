import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gatitos_app/ui/pages/details_page.dart';
import 'package:gatitos_app/ui/pages/home_page.dart';
import 'package:gatitos_app/ui/pages/splash_page.dart';
import 'package:gatitos_app/ui/widgets/card_cats.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Testing complete flow of CatBreeds App', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: SplashPage(),
      ),
    );
    await widgetTester.pumpAndSettle(const Duration(seconds: 20));

    expect(find.byType(HomePage), findsOneWidget);

    await widgetTester.tap(find.byKey(const Key('abys')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(DetailsPage), findsOneWidget);
    // expect(find.byKey(const Key('descriptionImg_abys')), findsOneWidget);
    // expect(find.byKey(const Key('origin_abys')), findsOneWidget);
    // expect(find.byKey(const Key('intelligence_abys')), findsOneWidget);
    // expect(find.byKey(const Key('adaptability_abys')), findsOneWidget);
    // expect(find.byKey(const Key('lifespan_abys')), findsOneWidget);
    // expect(find.byKey(const Key('temperament_abys')), findsOneWidget);

    await widgetTester.tap(find.byKey(const Key('detailsPageBackIcon')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    await widgetTester.enterText(
        find.byKey(const Key('searchWidgetTextField')), 'ame');
    await widgetTester.pumpAndSettle();

    expect(find.byType(CardsCatsWidget), findsWidgets);
    await widgetTester.tap(find.byKey(const Key('abob')));
    await widgetTester.pumpAndSettle();

    expect(find.byType(DetailsPage), findsOneWidget);
  });
}
