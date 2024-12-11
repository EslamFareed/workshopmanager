class AppValidation {
  static String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'من فضلك ادخل بريدك الالكتروني';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'من فضلك ادخل بريد الكتروني صحيح';
    }
    return null;
  }

  static String? phoneNumberVaildtor(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "من فضلك ادخل رقم الهاتف";
    }
    if (phoneNumber.length != 9) {
      return "يجب ان يكون رقم الهاتف 9 ارقام";
    }
    return null;
  }

  static String? passwordVaildtor(
    String? vlaue, {
    bool lengthValidation = true,
  }) {
    if (vlaue!.isEmpty) {
      "من فضلك ادخل كلمة المرور";
    }
    if (lengthValidation && vlaue.length < 8) {
      return "خطاء فى كلمة المرور";
    }
    return null;
  }

  static String? confirmPasswordVaildtor({String? password, String? value}) {
    if (value != password) {
      return "يجب تطابق كلمة المرور";
    }
    return null;
  }

  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "من فضلك ادخل اسم المستخدم";
    }
    return null;
  }

  static String? companyNameValidator(String? companyName) {
    if (companyName == null || companyName.isEmpty) {
      return "من فضلك ادخل اسم الشركة";
    }
    return null;
  }

  static String? arDescriptionValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "من فضلك اضف وصفا عن مركز الصيانة ";
    }
    return null;
  }

  static String? cancellationReason(String? companyName) {
    if (companyName == null || companyName.isEmpty) {
      return "من فضلك ادخل سبب الالغاء ";
    }
    return null;
  }
}
