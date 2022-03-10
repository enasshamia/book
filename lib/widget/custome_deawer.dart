


import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:book/widget/changeThemewidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomeDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final controlBloc = Provider.of<PageControlProvider>(context);
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          
          children: [
            SizedBox(height: 100,),
              ListTile(
              leading: const Text("الوضع الليلي"),
              trailing:   ChangeThemeButton(),
            ),
            Divider(height: 20,thickness: 10,),

             ListTile(
              leading: const Text("تكبير الخط"),
            trailing:  IconButton(icon: Icon(Icons.plus_one),onPressed: () {
              controlBloc.increaseFontSize();
            },),
             ),
               Divider(height: 20,thickness: 10,),
       ListTile(
              leading: const Text("تصغير الخط"),
            trailing:  IconButton(icon: Icon(Icons.minimize),onPressed: () {
              controlBloc.decreaseFontSize();
            },),
             )
          ],
        ),
      ),
    );
  }
}