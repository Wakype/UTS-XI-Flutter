import 'package:flutter/services.dart';
import '../model/usersData.dart';

class UsersService {
  getData() async {
    final String response = await rootBundle.loadString('assets/json/login.json');

    DataUsers data = dataUsersFromJson(response);
    return data.data;
  }
}
