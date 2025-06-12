import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class WebSettingsTile extends StatelessWidget {
  const WebSettingsTile({
    required this.tileType,
    required this.leading,
    required this.title,
    required this.description,
    required this.onPressed,
    required this.onToggle,
    required this.value,
    required this.initialValue,
    required this.activeSwitchColor,
    required this.enabled,
    required this.trailing,
    super.key,
  });

  final SettingsTileType tileType;
  final Widget? leading;
  final Widget? title;
  final Widget? description;
  final Function(BuildContext context)? onPressed;
  final Function(bool value)? onToggle;
  final Widget? value;
  final bool initialValue;
  final bool enabled;
  final Widget? trailing;
  final Color? activeSwitchColor;

  @override
  Widget build(final BuildContext context) {
    final theme = SettingsTheme.of(context);
    final scaleFactor = MediaQuery.of(context).textScaler;

    final cantShowAnimation = tileType == SettingsTileType.switchTile ? onToggle == null && onPressed == null : onPressed == null;

    return IgnorePointer(
      ignoring: !enabled,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: cantShowAnimation
              ? null
              : () {
                  if (tileType == SettingsTileType.switchTile) {
                    onToggle?.call(!initialValue);
                  } else {
                    onPressed?.call(context);
                  }
                },
          highlightColor: theme.themeData.tileHighlightColor,
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 24,
                  ),
                  child: IconTheme(
                    data: IconTheme.of(context).copyWith(
                      color: theme.themeData.leadingIconsColor,
                    ),
                    child: leading!,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 24,
                    end: 24,
                    bottom: scaleFactor.scale(19),
                    top: scaleFactor.scale(19),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          color: theme.themeData.settingsTileTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        child: title ?? Container(),
                      ),
                      if (value != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: theme.themeData.tileDescriptionTextColor,
                            ),
                            child: value!,
                          ),
                        )
                      else if (description != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              color: theme.themeData.tileDescriptionTextColor,
                            ),
                            child: description!,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // if (tileType == SettingsTileType.switchTile)
              //   SizedBox(
              //     height: 30,
              //     child: VerticalDivider(),
              //   ),
              if (tileType == SettingsTileType.navigationTile)
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: IconTheme(
                    data: IconTheme.of(context).copyWith(color: theme.themeData.leadingIconsColor),
                    child: Icon(
                      CupertinoIcons.chevron_forward,
                      size: scaleFactor.scale(28.0),
                    ),
                  ),
                )
              else if (tileType == SettingsTileType.switchTile)
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
                  child: Switch.adaptive(
                    value: initialValue,
                    onChanged: onToggle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
