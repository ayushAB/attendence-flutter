import 'package:hive_flutter/hive_flutter.dart';
part 'Login.g.dart';

@HiveType(typeId: 0)
class Login extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;
}
