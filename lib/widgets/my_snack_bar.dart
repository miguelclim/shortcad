import 'package:flutter/material.dart';
import 'package:shortcad/app/utils/app_colors.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({super.key, required this.mensaje});

  final String mensaje;
  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(widget.mensaje),
      backgroundColor: AppColors.primary,
    );
  }
}