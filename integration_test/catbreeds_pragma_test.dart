import 'package:integration_test/integration_test.dart';
import 'catbreeds_verify_tap_cat_test.dart' as tap_cat;
import 'catbreeds_search_cat_test.dart' as search;
import 'catbreeds_add_favorites_test.dart' as favorites;
import 'catbreeds_delete_favorites_test.dart' as delete;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  tap_cat.main();
  search.main();
  favorites.main();
  delete.main();
}
