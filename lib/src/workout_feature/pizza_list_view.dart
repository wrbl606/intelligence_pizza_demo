import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence/model/representable.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.gr.dart';
import 'package:intelligence_demo_hr_tech/src/workout_feature/pizza.dart';

@RoutePage()
class PizzaListView extends StatefulWidget {
  const PizzaListView({super.key});

  @override
  State<PizzaListView> createState() => _PizzaListViewState();
}

class _PizzaListViewState extends State<PizzaListView> {
  @override
  void initState() {
    super.initState();
    Intelligence().populate(
      pizzas
          .map((pizza) =>
              Representable(representation: pizza.name, id: pizza.id))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        restorationId: 'sampleItemListView',
        slivers: [
          SliverAppBar(
            title: const Padding(
                padding: EdgeInsets.only(bottom: 10), child: Text('Menu')),
            pinned: true,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(bottom: 5),
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Kitchen is open to orders',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: pizzas.length,
            itemBuilder: (context, index) {
              final Pizza(:id, :price, :name, :assetPath) = pizzas[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.elliptical(10, 12),
                          topRight: Radius.elliptical(10, 12),
                        ),
                        child: AspectRatio(
                          aspectRatio: 5 / 2,
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text.rich(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: name,
                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(text: ' • '),
                                    TextSpan(text: '$price€'),
                                  ],
                                ),
                              ),
                            ),
                            CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(1000)),
                              onPressed: () {
                                context.pushRoute(PizzaDetailsRoute(id: id));
                              },
                              color: Colors.red.shade800,
                              child: const Text('Get'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
