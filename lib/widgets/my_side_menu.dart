import 'package:flutter/material.dart';
import 'package:shortcad/app/pages/home/categories_page.dart';
import 'package:shortcad/app/pages/home/home_page.dart';
import 'package:shortcad/app/utils/app_colors.dart';

class MySideMenu extends StatefulWidget {
  const MySideMenu({super.key});

  @override
  State<MySideMenu> createState() => _MySideMenuState();
}

class _MySideMenuState extends State<MySideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primary),
            child: Text(
              "Shortcad",
              style: TextStyle(color: AppColors.neutral),
            ),
          ),
          ListTile(
            title: const Text("Inicio"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage(cat: "",)));
            },
          ),
          ListTile(
            title: const Text("Categorias"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesPage()));
            },
          )
        ],
      ),
    );
  }
}
