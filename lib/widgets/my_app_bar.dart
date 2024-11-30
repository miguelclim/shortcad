import 'package:flutter/foundation.dart';
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
      title: const Text(
        "Shortcad",
        style: TextStyle(color: AppColors.neutral),
      ),
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.neutral),
    );
  }
}
