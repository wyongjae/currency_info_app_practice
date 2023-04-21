import 'package:currency_info_app_prac/di/di_setup.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_screen.dart';
import 'package:currency_info_app_prac/presentation/currency_screen/currency_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<CurrencyViewModel>(),
        child: const CurrencyScreen(),
      ),
    ),
  ],
);
