import 'dart:convert';

import 'package:childcare/Models/add_child.dart';
import 'package:childcare/Models/child_data.dart';
import 'package:childcare/Models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/editchild_model.dart';

class LoginApiService {
  Future<LoginResponse> login(Map<String, dynamic> param) async {
    String url = "https://childcare.pythonanywhere.com/auth/login";

    final response = await http.post(Uri.parse(url), body: param);

    final data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(data);
    } else {
      return LoginResponse.fromError(data);
    }
  }
}

// child data
class AddChildData {
  Future<PostChild> addchild(Map<String, dynamic> param) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("userstatus");
    String url = "https://childcare.pythonanywhere.com/staff-children";

    final response = await http.post(
      Uri.parse(url),
      body: param,
      headers: {"Authorization": "Bearer ${token}"},
    );

    final data = jsonDecode(response.body);
    print("hii");
    print(param);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return PostChild.fromJson(data);
    } else {
      return PostChild.fromJson(data);
    }
  }
}

// edit data
class EditChildData {
  Future<UpdateModel> editchild(Map<String, dynamic> param) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("userstatus");
    String url = "https://childcare.pythonanywhere.com/staff-children";

    final response = await http.put(
      Uri.parse(url),
      body: param,
      headers: {"Authorization": "Bearer ${token}"},
    );

    final data = jsonDecode(response.body);
    print("hii");
    print(param);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return UpdateModel.fromJson(data);
    } else {
      return UpdateModel.fromJson(data);
    }
  }
}
