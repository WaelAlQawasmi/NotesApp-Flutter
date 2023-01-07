import 'package:flutter/material.dart';
import 'package:my_notes/Serveses/Auth.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<Auth>(context,listen: false).User?.profile_photo_url);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Consumer<Auth>(builder: (context, auth, child) {
              return UserAccountsDrawerHeader(accountName: Text("${auth.User?.name.toString()}" ),
              accountEmail:Text("${auth.User?.email.toString()}") ,
              currentAccountPicture: CircleAvatar(backgroundImage:NetworkImage("https://avatars.githubusercontent.com/u/47054275?v=4",),));}
                ),


             Container(
alignment: Alignment.center,
               height: 400,
               width: 300,
               child: ListView(

                children: [
                  ListTile(title: Text("logout"),
                  leading: Icon(Icons.logout),
                  onTap: (){
                    Provider.of<Auth>(context,listen: false).logout();
                    Navigator.pushReplacementNamed(context, '/signin');
                  },)
                ],
            ),
             )
          ],
        ),
      ),
    );
  }
}
