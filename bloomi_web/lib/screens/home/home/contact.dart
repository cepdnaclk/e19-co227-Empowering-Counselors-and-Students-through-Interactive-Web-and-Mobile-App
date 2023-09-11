import 'package:bloomi_web/components/contact_cart.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return ContactCart(
      mediaQueryData: mediaQueryData,
    );
  }
}
