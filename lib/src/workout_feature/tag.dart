import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: child,
    );
  }
}
