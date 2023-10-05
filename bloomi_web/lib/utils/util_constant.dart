import 'package:flutter/material.dart';

class UtilConstants {
  //--------------------App Colors--------------------
  static const Color primaryColor = Color(0xff2F76BA);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static Color lightblackColor = Colors.black.withOpacity(0.4);
  static Color pinkColor = Colors.pink.shade400;
  static Color greenColor = Colors.green.shade300;
  static Color lightRedColor = Colors.red.shade300;
  static Color lightBrownColor = Colors.brown.shade100;
  static Color lightgreyColor = Colors.grey.shade200;
  static Color greyColor = Colors.grey;
  static Color naturePageTopicColor =
      const Color.fromARGB(255, 11, 62, 104).withOpacity(0.8);
  static Color naturePageShadowColor = Colors.blue.withOpacity(0.5);
  static Color homePageBackgroundColor =
      const Color.fromARGB(255, 235, 226, 238);
  static Color homeBackgroundColor =
      const Color.fromARGB(255, 163, 220, 248).withOpacity(0.5);
  static Color homePageQuoteTitleColor = const Color.fromARGB(255, 2, 75, 80);
  static Color homepageQuoteBackgroundColor =
      const Color.fromARGB(255, 177, 223, 220).withOpacity(0.6);
  static Color homepageQuoteShadowColor =
      const Color.fromARGB(255, 155, 154, 154).withOpacity(0.8);

//-------------------topBar / Drawer-------------------
  static Color canvasColor = const Color(0xFF272643);
  static Color scaffoldBackgroundColor = const Color(0xFF464667);
  static Color accentCanvasColor = const Color(0xFF3E3E61);
  static Color actionColor =
      const Color.fromARGB(255, 50, 50, 132).withOpacity(0.6);

  //--------------------Gradient Shader--------------------
  static Shader get gradientShader => LinearGradient(
          colors: [primaryColor, pinkColor, greenColor, lightRedColor])
      .createShader(const Rect.fromLTWH(20.0, 200.0, 200.0, 20.0));

  // -------------------Titles used for home page
  static const String selfCareTitle =
      "\"Self-care is the fuel that allows your light to shine brightly.\"";

  //--------------------Image path--------------------

  static const String primaryImagePath = "assets/images/logo.png";
  static const String counsellingImagePath = "assets/images/counselling.png";
  static const String googleImagePath = "assets/images/google.png";
  static const String facebookImagePath = "assets/images/facebook.jpeg";
  static const String profImagePath = "assets/images/prof.webp";
  static const String talkImagePath = "assets/images/talk.png";
  static const String registerImagePath = "assets/images/registration.jpeg";
  static const String selfCareImagePath = "assets/images/selfcare.png";
  static const String selfCareIsntSelfishImagePath =
      "assets/images/self_care_isnt_selfish.png";
  static const String otherImagePath = "assets/images/self.png";
  static const String yogaImagePath = "assets/images/yoga_image.png";
  static const String finalYogaImagePath = "assets/images/yoga_final.png";
  static const String uttanasanaImagePath = "assets/images/uttanasana.gif";
  static const String viparitaImagePath = "assets/images/Viparita_Karani.png";
  static const String shavasanaImagePath = "assets/images/shavasana.png";
  static const String balasanaOneImagePath = "assets/images/balasana_1.png";
  static const String balasanaTwoImagePath = "assets/images/balasana_2.png";
  static const String setuImagePath = "assets/images/Setu_bandhasana.png";
  static const String anjaneyasanaImagePath = "assets/images/Anjaneyasana.png";
  static const String garudasanaImagePath = "assets/images/garudasana.png";
  static const String natureHealingImagePath = "assets/images/nature.png";
  static const String sunsetHealingImagePath = "assets/images/sunset.png";
  static const String feelingStressedImagePath =
      "assets/images/feeling_stressed.png";
  static const String diamondImagePath = "assets/images/diomend.png";
  static const String diamondLastImagePath = "assets/images/work_hard.png";
  static const String travelImagePath = "assets/images/travel.png";
  static const String travelLastImagePath = "assets/images/travel_last.png";
  static const String friendsImagePath = "assets/images/friends.png";
  static const String friendLastImagePath = "assets/images/friend_last.png";
  static const String gardeningImagePath = "assets/images/gard.png";
  static const String gardtwoImagePath = "assets/images/gardd.png";
  static const String readImagePath = "assets/images/read.png";
  static const String readlastImagePath = "assets/images/readlast.png";
  static const String wildImagePath1 = "assets/images/wild.png";
  static const String wildImagePath2 = "assets/images/wildd.png";
  static const String wildImagePath3 = "assets/images/animals.png";
  static const String musicImagePath1 = "assets/images/musicc.webp";
  static const String musicImagePath2 = "assets/images/music.webp";
  static const String cookingImagePath1 = "assets/images/cooking1.png";
  static const String cookingImagePath2 = "assets/images/cooking2.png";
  static const String dummyProfileUrl =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";

  //-----------------------Color palette----------------------
  static Color marinerColor = const Color(0xff2F76BA);
  static Color footerColor = Color.fromARGB(255, 17, 64, 107);
  static Color tropicalBlurColor = const Color(0xffD1E5FA);

  //-----------------------const dimensions desktop version----------------------
  static const double loginPageFontSizeDesktop = 17.0;
  static const double desktopFormWidth = 400.0;
  static const double formPaddingHorizontalDesktop = 30.0;
  static const double formPaddingVerticalDesktop = 40.0;
  static const double formBoardRadiusDesktop = 10.0;
  static const double spaceBetweenHeadingAndInputDesktop = 40.0;
  static const double formInputFeildHeightDesktop = 50.0;
  static const double textForntSizeDesktop = 15.0;
  static const double lableFontSizeDesktop = 15.0;
  static const double spaceBetweenInputDesktop = 10.0;
  static const double spaceBetweenInputAndHeadingDesktop = 20.0;
  static const double customLinkTextDesktop = 15.0;
  static const double buttonTextSizeDesktop = 18.0;

  //-----------------------const dimensions mobile version----------------------

  static const double loginPageFontSizeMobile = 17.0;
  static const double mobileFormWidth = 300.0;
  static const double formPaddingHorizontalMobile = 20.0;
  static const double formPaddingVerticalMobile = 20.0;
  static const double formBoardRadiusMobile = 10.0;
  static const double spaceBetweenHeadingAndInputMobile = 40.0;
  static const double formInputFeildHeightMobile = 50.0;
  static const double textForntSizeMobile = 16.0;
  static const double lableFontSizeMobile = 18.0;
  static const double spaceBetweenInputMobile = 10.0;
  static const double spaceBetweenInputAndHeadingMobile = 20.0;
  static const double customLinkTextMobile = 10.0;
  static const double buttonTextSizeMobile = 18.0;
  static const double mobileHeadingTextFontSize = 20.0;
  static const double mobileInputFontSize = 12.0;
  static const double mobileinputHeight = 45.0;
  static const double mobileInputWidth = 280.0;
  static const double mobileLableFontSize = 12.0;

  //-----------------------const dimensions tablet version----------------------
  static const double loginPageFontSizeTablet = 17.0;
  static const double tabletFormWidth = 400.0;
  static const double formPaddingHorizontalTablet = 30.0;
  static const double formPaddingVerticalTablet = 40.0;
  static const double formBoardRadiusTablet = 10.0;
  static const double spaceBetweenHeadingAndInputTablet = 40.0;
  static const double formInputFeildHeightTablet = 50.0;
  static const double textForntSizeTablet = 16.0;
  static const double lableFontSizeTablet = 18.0;
  static const double spaceBetweenInputTablet = 10.0;
  static const double spaceBetweenInputAndHeadingTablet = 20.0;
  static const double customLinkTextTablet = 15.0;
  static const double buttonTextSizeTablet = 18.0;
}
