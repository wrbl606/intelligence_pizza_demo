import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.dart';

class HrTechWithIntelligenceApp extends StatelessWidget {
  HrTechWithIntelligenceApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      restorationScopeId: 'app',
      routerConfig: _appRouter.config(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      builder: (context, child) {
        Intelligence().selectionsStream().listen((selection) {
          _appRouter.pushNamed('/$selection');
        });
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
