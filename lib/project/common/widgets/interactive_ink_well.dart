import 'package:flutter/material.dart';

class InteractiveInkWell extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? backgroundColor;
  final double radius;
  final bool useSplash;
  final BorderRadiusGeometry? borderRadius;

  const InteractiveInkWell({
    this.child,
    this.backgroundColor,
    this.onTap,
    this.onLongPress,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.useSplash = true,
    this.radius = 0,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        child: Theme(
          data: useSplash
              ? Theme.of(context)
              : ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
          child: InkWell(
            borderRadius: borderRadius?.resolve(Directionality.of(context)) ?? BorderRadius.circular(radius),
            onTap: onTap,
            onLongPress: onLongPress,
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
