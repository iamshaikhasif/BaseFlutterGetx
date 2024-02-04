abstract class Validators {
  static const String emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$';
  static const String dobPattern = r'^(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-(19\d{2}|20\d{2}|21\d{2})$';
  static const String namePattern = r'^[A-Za-z]+(?:\s[A-Za-z]+)*$';
  static const String mobilePattern = r'^[6-9][0-9]{9}$';
  static const String numericPattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
  static const String alphaNumericPattern = r'^(?!\s*$)[a-zA-Z0-9- ]{1,20}$';
}
