// ignore_for_file: file_names
//office ip = 192.168.1.87
// home ip = 192.168.1.3

String off = "192.168.1.87";
String home = "192.168.1.3";

class ApiConstants {
  static String ip = home;
  String loginApi = "http://${ApiConstants.ip}:5500/login";
}
