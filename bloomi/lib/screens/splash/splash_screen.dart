import 'package:animate_do/animate_do.dart';
import 'package:bloomi/components/custom_image.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/screens/auth/signup/sign_discription.dart';
import 'package:bloomi/utils/util_constant.dart';
import 'package:bloomi/utils/util_function.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      UtilFunction.navigateForward(context, const SignUpDescription());
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              UtilConstants.primaryColor.withOpacity(0.09),
              UtilConstants.primaryColor.withOpacity(0.2),
              UtilConstants.primaryColor.withOpacity(0.6)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: mediaQueryData.size.height * 0.22),
              Pulse(
                child: CustomImage(
                  width: mediaQueryData.size.height * 0.35,
                  height: mediaQueryData.size.height * 0.24,
                ),
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return UtilConstants.gradientShader;
                },
                child: CustomText(
                  "BLOOMi",
                  fontWeight: FontWeight.w400,
                  fontSize: mediaQueryData.size.height * 0.05,
                ), // Wrap CustomText with ShaderMask
              ),
              SizedBox(height: mediaQueryData.size.height * 0.3),
              CustomText(
                "From\nUniversity of Peradeniya",
                fontSize: mediaQueryData.size.height * 0.02,
                fontColor: UtilConstants.whiteColor,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
