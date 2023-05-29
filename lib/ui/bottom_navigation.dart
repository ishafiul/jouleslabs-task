import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends HookWidget {
  final Widget child;

  const BottomNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedIndex = useState(0);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (int index) {
          selectedIndex.value = index;
          handelRoute(index: index, context: context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_outlined),
            activeIcon: Icon(Icons.dashboard_customize),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.qr_code_scanner),
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
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
    }
  }
}
