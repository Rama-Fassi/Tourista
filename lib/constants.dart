import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

const kName = 'Tourista';
const kOnboarding = 'onboarding';
const kTokenBox = 'token';
const kTokenRef = 'tokenRef';

const kFontIntro = "source-serif-pro";
String kToken = Hive.box(kTokenBox).get(kTokenRef);
const kTransitionDuration = Duration(milliseconds: 200);
const kPrimaryColor = Color(0xff338E63);
const kGreenColor = Color(0xffA0D8B3);
const kBlueColor = Color(0xffC6E2EF);
const kDarkBlueColor = Color(0xff003680);
Color kYellowColor = const Color(0xffFFD34E);
