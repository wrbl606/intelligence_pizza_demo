// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:intelligence_demo_hr_tech/src/workout_feature/pizza_details_view.dart'
    as _i1;
import 'package:intelligence_demo_hr_tech/src/workout_feature/pizza_list_view.dart'
    as _i2;

/// generated route for
/// [_i1.PizzaDetailsView]
class PizzaDetailsRoute extends _i3.PageRouteInfo<PizzaDetailsRouteArgs> {
  PizzaDetailsRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          PizzaDetailsRoute.name,
          args: PizzaDetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PizzaDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PizzaDetailsRouteArgs>(
          orElse: () => PizzaDetailsRouteArgs(id: pathParams.getString('id')));
      return _i1.PizzaDetailsView(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class PizzaDetailsRouteArgs {
  const PizzaDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'PizzaDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.PizzaListView]
class PizzaListRoute extends _i3.PageRouteInfo<void> {
  const PizzaListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PizzaListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PizzaListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.PizzaListView();
    },
  );
}
