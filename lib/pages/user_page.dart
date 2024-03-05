import 'package:flutter/material.dart';
import 'package:hive_db/service/hive_service.dart';

import '../model.dart';

class UserPage extends StatefulWidget {
  static const String id = "user_page";

  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  void saveObj() {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    int age = int.parse(_ageController.text.trim());

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        age != null) {
      User user = User(
          firstName: firstName, lastName: lastName, email: email, age: age);
      HiveService.storeObject(obj: user, objKey: "user");
    }
  }

  void getObj() {
    User user = HiveService.getUserObject(userKey: "user");
    print(user.firstName);
    print(user.lastName);
    print(user.email);
    print(user.age);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Hive object",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(hintText: 'First name'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(hintText: 'Last name'),
              ),
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
                controller: _ageController,
                decoration: const InputDecoration(hintText: 'age'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveObj();
                  },
                  child: const Text("Save")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    getObj();
                  },
                  child: const Text("Get")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Delete")),
            ],
          ),
        ),
      ),
    );
  }
}
