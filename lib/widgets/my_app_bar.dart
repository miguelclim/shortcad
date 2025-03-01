import 'package:flutter/material.dart';
import 'package:shortcad/app/utils/app_colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Accesos directos de AutoCAD",
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
