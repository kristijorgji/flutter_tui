import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:single_app/ui/app_colors.dart';

class UserOption extends StatefulWidget {
  final String? svgPath;
  final Widget? child;
  final String semanticLabel;
  final Function? onPressed;

  const UserOption(
      {Key? key,
      required this.svgPath,
      this.child,
      required this.semanticLabel,
      this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserOptionState();
}

class _UserOptionState extends State<UserOption>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _controller.value;

    return Transform.scale(
      scale: _scale,
      child: RawMaterialButton(
        onPressed: _onPressed,
        child: widget.child ??
            SvgPicture.asset(widget.svgPath!,
                width: 32, height: 32, semanticsLabel: widget.semanticLabel),
        shape: const CircleBorder(),
        elevation: 1.0,
        fillColor: AppColors.White,
        padding: const EdgeInsets.all(15.0),
      ),
    );
  }

  void _onPressed() {
    if (widget.onPressed == null) {
      return;
    }
    _controller.forward();
    Timer(const Duration(milliseconds: 200), () => _controller.reverse());
    widget.onPressed!();
  }
}
