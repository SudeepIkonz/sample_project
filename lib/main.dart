// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_project/views/login_view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo Flutter',
    home: const RegisterView(),
  ));
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 99, 182, 255),
        centerTitle: true,
        title: Text(
          "Register",
          style: GoogleFonts.laila(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration:
                const InputDecoration(hintText: "Enter your email here"),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration:
                const InputDecoration(hintText: "Enter your password here"),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              detailsDb.add({"email": email, "password": password});
              print(detailsDb);
              AlertDialog(
                content: Text("Successfully Registered"),
              );
            },
            child: const Text("Register"),
          ),
          TextButton(
              onPressed: () async {
                print(detailsDb);
              },
              child: Text("View Registered mails"))
        ]),
      ),
    );
  }
}
