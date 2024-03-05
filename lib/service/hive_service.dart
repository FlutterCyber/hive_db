import 'dart:convert';

import 'package:hive/hive.dart';

import '../model.dart';

class HiveService {
  static var myBox = Hive.box('emailPassword');
  static var userBox = Hive.box('user');

  static storeInfo({required String email, required String password}) {
    myBox.put('email', email);
    myBox.put('password', password);
    print('email and password saved succesfully');
  }

  static getInfo({required String emailKey, required String passwordKey}) {
    var email = myBox.get(emailKey);
    var password = myBox.get(passwordKey);
    print("EMAIL IS: $email");
    print("PASSWORD IS: $password");
  }

  static deleteInfo({required String emailKey, required String passwordKey}) {
    myBox.delete(emailKey);
    myBox.delete(passwordKey);
    print('email and password deleted succesfully');
  }

  static storeObject({required var obj, required String objKey}) {
    String objString = jsonEncode(obj);
    userBox.put(objKey, objString);
    print("User object saved successfully");
  }

  static User getUserObject({required String userKey}) {
    String userString = userBox.get(userKey);
    Map<String, dynamic> objMap = jsonDecode(userString);
    User user = User.fromJson(objMap);
    return user;
  }
}
