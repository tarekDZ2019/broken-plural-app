import 'package:broken_plural_ar/core/enum/ProviderState.dart';
import 'package:broken_plural_ar/core/provider/BaseProvider.dart';
import 'package:broken_plural_ar/core/services/routing/navigation_service.dart';
import 'package:broken_plural_ar/locator.dart';
import 'dart:developer';
import 'package:logging/logging.dart';
// import 'package:broken_plural_ar/core/data/RouteName.dart' as routes;

class HomePageProvider extends BaseProvider {
  final NavigationService _navigationService = locator<NavigationService>();

  static var _log = Logger('HomePageProvider');

  Future navigateTo(String pageName) async {
    await _navigationService.navigateTo(pageName);
    setErrorMessage(null);

    setState(ProviderState.Idel);
  }
}
