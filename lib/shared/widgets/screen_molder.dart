import 'package:clima_run/core/constants/app_icon.dart';
import 'package:clima_run/core/constants/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class ScreenMolder extends StatefulWidget {
  const ScreenMolder({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<ScreenMolder> createState() => _ScreenMolderState();
}

class _ScreenMolderState extends State<ScreenMolder> {
  int previousIndex = 0;
  int get currentIndex => widget.navigationShell.currentIndex;
  @override
  Widget build(BuildContext context) {
    final int direction = currentIndex > previousIndex
        ? 1
        : (currentIndex < previousIndex ? -1 : 0);
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: 400.ms,
            transitionBuilder: (child, animation) {
              return child
                  .animate(key: ValueKey(currentIndex))
                  .slide(
                    begin: Offset(direction.toDouble(), 0),
                    end: Offset(0, 0),
                    curve: Curves.easeInOut,
                  )
                  .fadeIn(duration: 500.ms);
            },
            child: widget.navigationShell,
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            previousIndex = currentIndex;
          });
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == currentIndex,
          );
        },
        backgroundColor: context.colorScheme.surfaceContainer,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: WidgetStateProperty.all(
          context.textTheme.labelLarge!.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        destinations: [
          NavigationDestination(
            icon: AppIcon(
              name: 'home_icon',
              primaryColor: context.colorScheme.onSurfaceVariant,
            ),
            label: 'Accueil',
            selectedIcon: AppIcon(
              name: 'home_icon',
              primaryColor: context.colorScheme.primary,
            ),
          ),
          NavigationDestination(
            icon: AppIcon(
              name: 'timeline_icon',
              primaryColor: context.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: AppIcon(
              name: 'timeline_icon',
              primaryColor: context.colorScheme.primary,
            ),
            label: 'Crénaux',
          ),
          NavigationDestination(
            icon: AppIcon(
              name: 'forecast_icon',
              primaryColor: context.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: AppIcon(
              name: 'forecast_icon',
              primaryColor: context.colorScheme.primary,
            ),
            label: 'Prévisions',
          ),
          NavigationDestination(
            icon: AppIcon(
              name: 'profile_icon',
              primaryColor: context.colorScheme.onSurfaceVariant,
            ),
            selectedIcon: AppIcon(
              name: 'profile_icon',
              primaryColor: context.colorScheme.primary,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
