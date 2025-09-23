import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class Links extends GetxController {
  void linkRedirect({required String link}) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'Oops!!',
        'Link is not opening',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void gmailRedirect({
    required String path,
    required String subject,
    required String body,
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: path,
      queryParameters: {'subject': subject, 'body': body},
    );
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'Oops!!',
        'Something went wrong',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
