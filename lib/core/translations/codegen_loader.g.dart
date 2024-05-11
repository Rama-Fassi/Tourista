// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "create_an_account": "إنشاء حساب جديد",
  "user_name": "اسم المستخدم",
  "phone_number ": "رقم الهاتف",
  "password": "كلمة المرور",
  "confirm_password": "تأكيد كلمة المرور",
  "sign_up": "إنشاء حساب",
  "or": "أو",
  "continue_with_google": "تسجيل الدخول باستخدام غوغل",
  "sign_in": "تسجيل الدخول",
  "already_have_an_account": "هل لديك حساب مسبقا؟",
  "sign_in_to_your_account": "تسجيل الدخول الى حسابك",
  "show": "عرض",
  "forget_password": "نسيت كلمة المرور؟",
  "dont_have_an_account": "ليس لديك حساب؟"
};
static const Map<String,dynamic> en = {
  "create_an_account": "Create an account",
  "user_name": "User name",
  "phone_number ": "Phone number ",
  "password": "Password",
  "confirm_password": "Confirm Password ",
  "sign_up": "Sign up",
  "or": "Or",
  "continue_with_google": "Continue With Google",
  "sign_in": "Sign in",
  "already_have_an_account": "Already hava an account?",
  "sign_in_to_your_account": "Sign in to your account",
  "show": "Show",
  "forget_password": "Forget Password?",
  "dont_have_an_account": "Don't have an account?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
