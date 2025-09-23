import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_icons/simple_icons.dart';

class SocialMediaIcon extends GetxController {
  var icon = [
    FontAwesomeIcons.linkedin,
    FontAwesomeIcons.github,
    SimpleIcons.gmail,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.facebook,
  ].obs;
}

class ContactController extends GetxController {
  // Text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();

  // Error messages
  var nameError = ''.obs;
  var emailError = ''.obs;
  var messageError = ''.obs;

  // Simple email regex
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Validation function
  bool validate() {
    bool isValid = true;

    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Name cannot be empty';
      isValid = false;
    } else {
      nameError.value = '';
    }

    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Email cannot be empty';
      isValid = false;
    } else if (!emailRegex.hasMatch(emailController.text.trim())) {
      emailError.value = 'Enter a valid email';
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (messageController.text.trim().isEmpty) {
      messageError.value = 'Message cannot be empty';
      isValid = false;
    } else {
      messageError.value = '';
    }

    return isValid;
  }
}
