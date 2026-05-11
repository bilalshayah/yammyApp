class Validators {

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم الكامل مطلوب';
    }
    if (value.length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }

 
    // if (!RegExp(r'^[\w\.-]+@gmail\.com$').hasMatch(value)) {
    //   return 'يجب إدخال بريد إلكتروني صحيح (example@gmail.com)';
    // }

    return null;
  }


  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    return null;
  }


  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != password) {
      return 'كلمة المرور غير متطابقة';
    }
    return null;
  }


  static String? validateNonEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return null; 
    }
    if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
      return 'رقم الهاتف غير صحيح';
    }
    return null;
  }
}
