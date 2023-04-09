import 'package:currency_info_app_prac/di/di_setup.dart';
import 'package:currency_info_app_prac/domain/use_case/get_currency_use_case.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
import 'package:currency_info_app_prac/presentation/test_screen/test_screen.dart';
import 'package:currency_info_app_prac/presentation/test_screen/test_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => CurrencyViewModel(getIt<GetCurrencyUseCase>()),
        child: const CurrencyScreen(),
      ),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => TestScreenViewModel(),
        child: const TestScreen(),
      ),
    ),
  ],
);
