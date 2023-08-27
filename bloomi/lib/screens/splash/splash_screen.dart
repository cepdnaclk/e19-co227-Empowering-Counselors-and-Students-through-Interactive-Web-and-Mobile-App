import 'package:animate_do/animate_do.dart';
import 'package:bloomi/components/custom_image.dart';
import 'package:bloomi/components/custom_text.dart';
import 'package:bloomi/screens/auth/signup/sign_discription.dart';
import 'package:bloomi/utils/util_constant.dart';
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpDescription()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              const SizedBox(height: 180),
              Pulse(
                child: const CustomImage(),
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return UtilConstants.gradientShader;
                },
                child: const CustomText(
                  "BLOOMi",
                  fontWeight: FontWeight.w400,
                ), // Wrap CustomText with ShaderMask
              ),
              const SizedBox(height: 290),
              const CustomText(
                "from\nUniversity of Peradeniya",
                fontSize: 20,
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
