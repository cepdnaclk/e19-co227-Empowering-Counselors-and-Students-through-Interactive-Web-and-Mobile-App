import 'package:animate_do/animate_do.dart';
import 'package:bloomi_web/components/custom_image.dart';
import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenMobile extends StatefulWidget {
  const SplashScreenMobile({super.key});

  @override
  State<SplashScreenMobile> createState() => _SplashScreenMobileState();
}

class _SplashScreenMobileState extends State<SplashScreenMobile> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //----------------------To check user auth state----------------------
      Provider.of<UserProvider>(context, listen: false).initializeUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
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
              children: [
                SizedBox(height: height * 0.3),
                Pulse(
                  child: const CustomImage(
                    width: 180,
                    height: 180,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return UtilConstants.gradientShader;
                  },
                  child: const CustomText(
                    "BLOOMi",
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ), // Wrap CustomText with ShaderMask
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Footer(height: 50, width: width),
    );
  }
}
