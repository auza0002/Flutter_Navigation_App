import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Enter your name",
                  iconColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.person),
                  hintText: "Diego",
                  hintStyle: TextStyle(color: Colors.blue.shade300)),
              onSaved: (value) {
                print("Name $value");
              },
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  return "Enter correct name";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Enter you phone number",
                  iconColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.phone),
                  hintStyle: TextStyle(color: Colors.blue.shade300),
                  hintText: "(123)-45678900"),
              onSaved: (value) {
                print("number $value");
              },
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                        .hasMatch(value)) {
                  return "Enter correct phone number";
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.blue.shade300),
                  hintText: "email@ep.com",
                  iconColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.email)),
              onSaved: (value) {
                print("email $value");
              },
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                        .hasMatch(value)) {
                  return "Enter correct email";
                } else {
                  return null;
                }
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: 100.0),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Text("submite"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
