import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

const kName = 'Tourista';
const kOnboarding = 'onboarding';
const kTokenBox = 'token';
const kUserInfoBox = 'userinfo';
const kUserNameRef = 'userNameRef';
const kUserPhoneRef = 'userphpneRef';
const kUserEmailRef = 'userEmailRef';
const kUserPointsRef = 'userUserPointsRef';

const kTokenRef = 'tokenRef';
const kBaseUrl = 'http://192.168.43.189:8000';
const kFontIntro = "source-serif-pro";
String kToken = Hive.box(kTokenBox).get(kTokenRef);
const kTransitionDuration = Duration(milliseconds: 200);
const kPrimaryColor = Color(0xff338E63);
const kGreenColor = Color(0xffA0D8B3);
const kBlueColor = Color(0xffC6E2EF);
const kDarkBlueColor = Color(0xff003680);
const kYellowColor = Color(0xffFFD34E);

const kCircleAvatarColoe = Color(0xff4A605D);

var kboxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.1),
  blurRadius: 3,
  offset: const Offset(8, 0), // changes position of shadow
);
