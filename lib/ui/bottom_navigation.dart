import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/colors.dart';

class BottomNav extends HookWidget {
  final Widget child;

  const BottomNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    TabController controller = useTabController(initialLength: 4);
    return Scaffold(
      bottomNavigationBar: TabBar(
        indicatorColor: ArtistaColor.primary,
        indicatorSize: TabBarIndicatorSize.label,
        controller: controller,
        unselectedLabelColor: Colors.grey,
        labelColor: ArtistaColor.primary,
        onTap: (index) {
          handelRoute(context: context, index: index);
        },
        tabs: const [
          Tab(icon: Icon(Icons.home_filled)),
          Tab(icon: Icon(Icons.bar_chart_outlined)),
          Tab(icon: Icon(Icons.notifications)),
          Tab(icon: Icon(Icons.person)),
        ],
      ),
      body: child,
    );
  }

  void handelRoute({required int index, required BuildContext context}) {
    switch (index) {
      case 0:
        {
          context.go("/home");
        }
      case 3:
        {
          context.go("/login");
        }
    }
  }
}
