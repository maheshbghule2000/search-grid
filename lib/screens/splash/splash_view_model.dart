import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../Routes/routes.locator.dart';
import '../../Routes/routes.router.dart';

@lazySingleton
class SplashViewModel extends BaseViewModel {
  final _nagivationService = locator<NavigationService>();
  Future handleStartUpLogic() async {
    _nagivationService.navigateTo(Routes.gridViewScreen);
  }
}
