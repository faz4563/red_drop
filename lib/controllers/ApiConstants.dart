// ignore_for_file: file_names
//office ip = 192.168.1.87
// home ip = 192.168.1.3

String off = "192.168.1.93";
String home = "192.168.1.6";

class ApiConstants {
  static String ip = off;
  String loginApi = "http://${ApiConstants.ip}:5500/login";
  String registerApi = "http://${ApiConstants.ip}:5500/register_user";
}
