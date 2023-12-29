import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../screens/grid/grid_view.dart';
import '../screens/grid/grid_view_model.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/splash/splash_view_model.dart';

@StackedApp(logger: StackedLogger(), routes: <StackedRoute>[
  MaterialRoute(
    page: SplashView,
    initial: true,
  ),
   MaterialRoute(
    page: GridViewScreen,
  ),
], dependencies: [
  LazySingleton(classType: SplashViewModel),
  LazySingleton(classType: NavigationService),
    LazySingleton(classType: GridViewModel),


])
class AppSetup {}
