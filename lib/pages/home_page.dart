import 'package:flutter/material.dart';
import 'package:hive_db/pages/user_page.dart';
import 'package:hive_db/service/hive_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void saveinfo() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      HiveService.storeInfo(email: email, password: password);
    } else {}
  }

  void getInfo() {
    HiveService.getInfo(emailKey: "email", passwordKey: 'password');
  }

  void deleteInfo() {
    HiveService.deleteInfo(emailKey: "email", passwordKey: "password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Hive",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, UserPage.id);
              },
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  saveinfo();
                },
                child: const Text("Save")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  getInfo();
                },
                child: const Text("Get")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  deleteInfo();
                },
                child: const Text("Delete")),
          ],
        ),
      ),
    );
  }
}
