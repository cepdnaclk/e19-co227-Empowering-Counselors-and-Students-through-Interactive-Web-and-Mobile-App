import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class SendEmailController {
  //---------------send email to counsellor for notify------------------
  Future<void> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String reciverName,
  }) async {
    const serviceId = 'service_xb1lme6';
    const templateId = 'template_jyvwz58';
    const userId = 'Qv6bgDTjUr1gaxfYi';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'resiver_name': reciverName,
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          },
        }));
    if (response.statusCode == 200) {
      Logger().e('Email sent');
    } else {
      Logger().e('Email not sent');
    }
  }

  //---------------send email to user for notify------------------
  Future<void> sendEmailToUser({
    required String name,
    required String email,
    required String message,
    required String reciverName,
  }) async {
    Logger().e(message);
    const serviceId = 'service_xb1lme6';
    const templateId = 'template_cebwkfi';
    const userId = 'Qv6bgDTjUr1gaxfYi';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'counsellor_name': reciverName,
            'user_name': name,
            'user_email': email,
            'user_message': message,
          },
        }));
    if (response.statusCode == 200) {
      Logger().e('Email sent');
    } else {
      Logger().e('Email not sent');
    }
  }
}
