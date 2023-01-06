import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text("wael"), accountEmail:Text("E@w.com")  ,currentAccountPicture: Image.network("https://www.pngmart.com/files/7/Note-PNG-Clipart.png"),)
          ],
        ),
      ),
    );
  }
}
