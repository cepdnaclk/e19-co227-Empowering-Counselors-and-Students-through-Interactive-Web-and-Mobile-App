import 'package:bloomi_web/components/contact_cart.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: UtilConstants.homeBackgroundColor,
      body: ContactCart(
        mediaQueryData: mediaQueryData,
      ),
    );
  }
}
