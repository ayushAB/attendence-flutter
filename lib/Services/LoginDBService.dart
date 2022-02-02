import 'package:attendence/Models/Login.dart';
import 'package:hive/hive.dart';

class LoginDBService {
  static Box<Login> getLogin() => Hive.box('Login');
}
