import 'package:book/bloc/pagecontrollerbloc.dart';
import 'package:book/widget/change_theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controlBloc = Provider.of<PageControlProvider>(context);
    return Drawer(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const ListTile(
              leading: Text("الوضع الليلي"),
              trailing: ChangeThemeButton(),
            ),
            const Divider(
              height: 20,
              thickness: 10,
            ),
            ListTile(
              leading: const Text("تكبير الخط"),
              trailing: IconButton(
                icon: const Icon(Icons.plus_one),
                onPressed: () {
                  controlBloc.increaseFontSize();
                },
              ),
            ),
            const Divider(
              height: 20,
              thickness: 10,
            ),
            ListTile(
              leading: const Text("تصغير الخط"),
              trailing: IconButton(
                icon: const Icon(Icons.minimize),
                onPressed: () {
                  controlBloc.decreaseFontSize();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
