// ignore_for_file: file_names
//office ip = 192.168.1.87
// home ip = 192.168.1.3

String off = "192.168.1.93";
String home = "192.168.1.6";

class ApiConstants {
  static String ip = home;
  static String loginApi = "http://${ApiConstants.ip}:5000/login";
  static String registerUserApi =
      "http://${ApiConstants.ip}:5000/register_user";
  static String registerDonorApi =
      "http://${ApiConstants.ip}:5000/register_donor";
  static String gettingBloodGroupApi =
      "http://${ApiConstants.ip}:5000/get_blood_list";
}
