import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/route_names.dart';
import 'app_bottom_nav.dart';

class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({
    required this.currentIndex,
    required this.title,
    required this.body,
    this.useSafeArea = true,
    super.key,
  });

  final int currentIndex;
  final String title;
  final Widget body;
  final bool useSafeArea;

  static const _paths = [
    RouteNames.watchlistPath,
    RouteNames.ordersPath,
    RouteNames.gttPath,
    RouteNames.portfolioPath,
    RouteNames.fundsPath,
    RouteNames.profilePath,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title)),
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            return;
          }
          context.go(_paths[index]);
        },
      ),
      body: useSafeArea ? SafeArea(child: body) : body,
    );
  }
}
