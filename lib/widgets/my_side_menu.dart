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
              style: TextStyle(color: AppColors.neutral,fontSize: 31),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined,color: AppColors.primary,),
            title: const Text("Inicio",style: TextStyle(color: AppColors.secondary)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage(cat: "Gestionar pantalla",)));
            },
          ),
          ListTile(
            leading: Icon(Icons.category_outlined,color: AppColors.primary),
            title: const Text("Categorias",style: TextStyle(color: AppColors.secondary),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesPage()));
            },
          ),
          Divider(color: AppColors.primary,),
          ListTile(            
            leading: Icon(Icons.phone_outlined,color: AppColors.primary),
            title: const Text("Contactanos",style: TextStyle(color: AppColors.secondary),),
          )
        ],
      ),
    );
  }
}
