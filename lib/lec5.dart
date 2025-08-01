import 'package:flutter/material.dart';

class Lec5 extends StatefulWidget {
  static const String path = '/lec5';
  const Lec5({super.key});

  @override
  State<Lec5> createState() => _Lec5State();
}

double width = 100;
double height = 100;

class _Lec5State extends State<Lec5> {
  @override
  void initState() {
    super.initState();
    width = 100;
    height = 100;
  }

  bool obSecurePassord = true;
  TextEditingController userCTR = TextEditingController();
  TextEditingController passwordCTR = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: width,
                height: height,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    width = MediaQuery.of(context).size.width;
                    height = 200;
                  });
                },
                child: const Text('Change Size'),
              ),
              TextFormField(
                controller: userCTR,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'e.g., Marwan',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                        },
                        icon: Icon(Icons.close)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordCTR,
                obscureText: obSecurePassord,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'passowrd',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          // if (obSecurePassord == true) {
                          //   obSecurePassord = false;
                          // } else {
                          //   obSecurePassord = true;
                          // }
                          obSecurePassord = !obSecurePassord;
                        });
                      },
                      icon: Icon(obSecurePassord ? Icons.visibility_off : Icons.visibility)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              Text('User Name ${userCTR.text}'),
              Text('Password ${passwordCTR.text}'),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {});
                    }
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
