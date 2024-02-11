import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/splash_screen.dart';

class AppRoutes {
  static const homeScreen = 'home_screen';
  static const splashScreen = 'splas_screen';
  static const promptScreen = 'prompt_screen';

  static final routes = {
    homeScreen: (context) => const HomeScreen(),
    splashScreen: (context) => const SplashScreen(),
    // promptScreen: (context) => const PromptScreen(),
  };
}
