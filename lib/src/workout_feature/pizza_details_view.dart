import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelligence_demo_hr_tech/src/workout_feature/pizza.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

@RoutePage()
class PizzaDetailsView extends StatefulWidget {
  const PizzaDetailsView({super.key, @PathParam() required this.id});

  final String id;

  @override
  State<PizzaDetailsView> createState() => _PizzaDetailsViewState();
}

final timeFormatter = DateFormat.Hm();

class _PizzaDetailsViewState extends State<PizzaDetailsView> {
  Pizza get workout => pizzas.firstWhere((c) => c.id == widget.id);

  var counter = 0;
  bool get countdownInProgress => counter < 0;

  late final StreamSubscription<int> _counterSub;

  @override
  void initState() {
    super.initState();
    var counterIndex = 0;
    _counterSub = Stream.fromIterable([
      for (int i = -3; i < 0; i++) i,
      for (int i = 30; i >= 0; i--) i,
      for (int i = 60; i >= 0; i--) i,
      for (int i = 20; i >= 0; i--) i,
    ])
        .flatMap((i) => TimerStream(i, Duration(seconds: 1 * counterIndex++)))
        .listen((counter) {
      setState(() {
        this.counter = counter;
      });
    });
  }

  @override
  void dispose() {
    _counterSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Pizza(:name, :price, :assetPath) = workout;
    const eta = Duration(minutes: 20);

    return SafeArea(
      bottom: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.elliptical(30, 20),
          topRight: Radius.elliptical(30, 20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CupertinoPageScaffold(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Image.asset(assetPath),
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black],
                                stops: [.2, 0.4]).createShader(rect);
                          },
                          blendMode: BlendMode.dstOut,
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: timeFormatter.format(
                                  DateTime.now().add(eta),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              const TextSpan(
                                text: ' at your place',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CupertinoColors.white,
                                ),
                              )
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Text(name),
                  Text('$price€'),
                  CupertinoButton.filled(
                    child: const Text('Order now'),
                    onPressed: () {},
                  ),
                  CupertinoButton(
                    child: const Text('Order for later'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Labeled extends StatelessWidget {
  const Labeled({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
