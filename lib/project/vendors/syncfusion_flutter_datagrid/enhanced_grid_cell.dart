import 'package:flutter/material.dart';

class EnhancedGridCell extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? padding;

  const EnhancedGridCell({
    required this.child,
    this.alignment = Alignment.centerLeft,
    this.padding,
    super.key,
  });

  factory EnhancedGridCell.text({
    required final String label,
    final Widget? icon,
    final AlignmentGeometry alignment = Alignment.centerLeft,
    final EdgeInsetsGeometry? padding,
    final TextStyle? textStyle,
    final Color? color,
  }) {
    return EnhancedGridCell(
      alignment: alignment,
      padding: padding,
      child: Row(
        spacing: 8.0,
        children: [
          ?icon,
          DefaultTextStyle(
            style: TextStyle(
              color: color ?? Colors.black87,
              fontSize: 14.0,
            ),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }

  factory EnhancedGridCell.bubbleText({
    required final String label,
    final AlignmentGeometry alignment = Alignment.centerLeft,
    final EdgeInsetsGeometry? outerPadding,
    final EdgeInsetsGeometry? innerPadding,
    final TextStyle? textStyle,
    required final Color backgroundColor,
    required final Color foregroundColor,
  }) {
    return EnhancedGridCell(
      alignment: alignment,
      padding: outerPadding,
      child: Container(
        padding: innerPadding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: foregroundColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    const padding = EdgeInsetsDirectional.only(start: 16);
    padding.add(this.padding ?? EdgeInsets.zero);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        alignment: alignment,
        padding: padding,
        child: child,
      ),
    );
  }
}
