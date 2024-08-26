import 'dart:ui';

class AppModulesModel {
  final String name;
  final String route;
  final String image;
  final String category;
  final Color? iconColor;
  final bool enabledByAdmin;

  AppModulesModel(
      {required this.name,
      required this.route,
      required this.image,
      required this.category,
      this.iconColor,
      this.enabledByAdmin = true});
}
