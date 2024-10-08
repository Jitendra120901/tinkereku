


import 'package:tinkereku/ApiHandler/appConfigConstant.dart';

//////******* Do not make any change in this file **********/////////

class NetworkConstantsUtil {
  static String baseUrl = AppConfigConstants.liveAppLink;

  // *************** Login and profile *************//
  static String login = 'data/login.php';
  static String logout = 'data/logout.php';
    static String forgetPasswod = 'data/forgetpass.php';
 static String resetPass = 'data/updatepass.php';


 // *************** Courses*************//
static String getAllCourses="data/getallcourse.php";

 // *************** Events *************//
 static String getAllEvents="data/getallevents.php";
 
}
