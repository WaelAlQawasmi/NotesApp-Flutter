import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var accountType = ['user', 'company', 'developer'];
  var selectedAcount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Full name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder()),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.password),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 2))),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(7),

                decoration: BoxDecoration(border: Border.all(color: Colors.black26,width: 2),),
                child: DropdownButton(
underline: Divider(color: Colors.transparent,),
                    icon: Icon(Icons.type_specimen_sharp),
                    hint: Text("please select account "),
                  isExpanded: true,
                    items: accountType.map((e) => DropdownMenuItem(
                          child: Text("$e"),
                          value: e,
                        )).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedAcount=val;
                      });
                    },
                  value: selectedAcount,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
