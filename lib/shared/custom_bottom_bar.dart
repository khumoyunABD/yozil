import 'package:flutter/material.dart';
import 'package:yozil/utils/utils.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CustomNavBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home,
              color: context.colorScheme.primary,
            ),
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _CustomNavBarItem(
            icon: const Icon(Icons.search_outlined),
            activeIcon: Icon(
              Icons.search,
              color: context.colorScheme.primary,
            ),
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _CustomNavBarItem(
            icon: const Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(
              Icons.calendar_month,
              color: context.colorScheme.primary,
            ),
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _CustomNavBarItem(
            icon: const Icon(Icons.person_outlined),
            activeIcon: Icon(
              Icons.person,
              color: context.colorScheme.primary,
            ),
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBarItem extends StatelessWidget {
  const _CustomNavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.isSelected,
    required this.onTap,
  });

  final Widget icon;
  final Widget activeIcon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: isSelected ? 1.0 : 0.0,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY((1 - value) * 0.5), // Rotate from right
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 1 - value,
                        child: icon,
                      ),
                      Opacity(
                        opacity: value,
                        child: activeIcon,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 300),
            //   width: 4,
            //   height: 4,
            //   decoration: BoxDecoration(
            //     color: isSelected
            //         ? context.colorScheme.primary
            //         : Colors.transparent,
            //     shape: BoxShape.circle,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
