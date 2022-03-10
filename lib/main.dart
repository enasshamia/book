import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:book/screen/pages.dart';
import 'package:book/screen/search_screen.dart';
import 'package:book/screen/textpageview.dart';
import 'package:book/theme/theme_provider.dart';
import 'package:book/widget/changeThemewidget.dart';
import 'package:book/widget/custome_deawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     
    return MultiProvider(
      providers: [
     
      ChangeNotifierProvider<PageControlProvider>(
       create: (context) => PageControlProvider(),
       builder: (context , _) {
        final providertheme = Provider.of<PageControlProvider>(context);
return  MaterialApp(
        themeMode:providertheme.themeMode,
       theme:  MyThemes.lightheme,
       darkTheme: MyThemes.darkthem,
      debugShowCheckedModeBanner: false,
    home: HomePage() ,
      );
       },
      ),
      ],
  
     
    );
  }
}
class HomePage extends  StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomeDrawer(),
      appBar: AppBar(
       actions: [
         IconButton(onPressed: () {
           showSearch(context: context ,delegate: searchScreen() );
         }, icon: Icon(Icons.search))
       ],
        title: 
      Text("app"),),
      body: PageScreen(),
    );
  }
}