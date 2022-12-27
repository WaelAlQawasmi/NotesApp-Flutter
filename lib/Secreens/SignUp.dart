import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _accountTypeController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var accountType = ['user', 'company', 'developer'];
  var selectedAcount;

  @override
  void initState() {}

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Full name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder()),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _passwordController,
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
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 2),
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    icon: Icon(Icons.type_specimen_sharp),
                    hint: Text("please select account "),
                    isExpanded: true,
                    items: accountType
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedAcount = val;
                      });
                    },
                    value: selectedAcount,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Map user = {
                        'name': _nameController.text,
                        'email':_emailController.text,
                        'password':_passwordController.text,
                        'accountType':selectedAcount

                      };
                      if (_formKey.currentState!.validate()) {
                        print(user);
                      }

                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
