import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.gr.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CupertinoRoute(
          page: PizzaListRoute.page,
          path: '/',
          initial: true,
        ),
        CustomRoute(
          customRouteBuilder:
              <T>(BuildContext context, Widget child, AutoRoutePage<T> page) {
            return CupertinoModalBottomSheetRoute(
              expanded: false,
              settings: page,
              elevation: 8,
              animationCurve: Curves.easeOutCirc,
              duration: const Duration(milliseconds: 500),
              builder: (context) => child,
            );
          },
          page: PizzaDetailsRoute.page,
          path: '/:id',
        ),
      ];
}
