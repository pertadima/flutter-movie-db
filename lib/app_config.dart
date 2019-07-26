import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  final String appDisplayName;
  final int appInternalId;

  AppConfig(
      {this.appDisplayName,
      this.appInternalId,
      Widget child})
      : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
