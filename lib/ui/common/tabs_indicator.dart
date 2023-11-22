import 'package:flutter/material.dart';

class TabsIndicator extends AnimatedWidget {
  const TabsIndicator({
    Key? key,
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
    this.horizontalPadding = 8.0,
  }) : super(key: key, listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color activeColor;
  final Color inactiveColor;
  final double horizontalPadding;

  static const double _kSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return itemCount <= 1
        ? const SizedBox.shrink()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                itemCount, (index) => _buildElement(context, index)),
          );
  }

  Widget _buildElement(BuildContext context, int index) {
    final int currentPage =
        controller.page == null ? 0 : controller.page!.round();
    final num totalWidth =
        MediaQuery.of(context).size.width - horizontalPadding;
    final double elWidth = (totalWidth - itemCount * _kSpacing) / itemCount;
    final double widthIncludingSpace = elWidth + _kSpacing;

    return SizedBox(
      width: widthIncludingSpace,
      child: Center(
        child: Material(
          color: currentPage == index ? activeColor : inactiveColor,
          type: MaterialType.card,
          child: SizedBox(
            width: elWidth,
            height: 6,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }
}
