import 'package:flutter/material.dart';
import 'package:shortcad/app/pages/categories_page.dart';
import 'package:shortcad/app/pages/home_page.dart';
import 'package:shortcad/app/pages/settings_page.dart';
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
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
            child: Text(
              "Shortcad",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 31),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined,color: Theme.of(context).colorScheme.primary,),
            title: Text("Inicio",style: TextStyle(color: Theme.of(context).colorScheme.primary )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage(cat: "",)));
            },
          ),
          ListTile(
            leading: Icon(Icons.category_outlined,color: Theme.of(context).colorScheme.primary),
            title: Text("Categorias",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.primary),
            title: Text("Ajustes",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
          // Divider(color: Theme.of(context).colorScheme.secondary,),
          // ListTile(            
          //   leading: Icon(Icons.phone_outlined,color: Theme.of(context).colorScheme.secondary),
          //   title: Text("Contactanos",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          // )
        ],
      ),
    );
  }
}
