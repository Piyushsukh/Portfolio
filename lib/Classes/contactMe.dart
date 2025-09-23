import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_icons/simple_icons.dart';

class SocialMedia {
  final String name;
  final IconData icon;
  final String url;

  const SocialMedia({
    required this.name,
    required this.icon,
    required this.url,
  });
}

class SocialMediaController extends GetxController {
  var social = [
    SocialMedia(
      name: 'LinkedIn',
      icon: FontAwesomeIcons.linkedin,
      url: 'https://www.linkedin.com/in/piyush-sukhwal/',
    ),
    SocialMedia(
      name: 'GitHub',
      icon: FontAwesomeIcons.github,
      url: 'https://github.com/PiyushSukh',
    ),
    SocialMedia(
      name: 'Gmail',
      icon: SimpleIcons.gmail,
      url: 'piyush25@gmail.com',
    ),
    SocialMedia(
      name: 'Twitter',
      icon: FontAwesomeIcons.twitter,
      url: 'https://x.com/SukhwaniPi3583',
    ),
    SocialMedia(
      name: 'Instagram',
      icon: FontAwesomeIcons.instagram,
      url: 'https://www.instagram.com/piyushsukhwal/',
    ),
    SocialMedia(
      name: 'Facebook',
      icon: FontAwesomeIcons.facebook,
      url: 'https://www.facebook.com/piyushsukhwal',
    ),
  ].obs;
}

class ContactController extends GetxController {
  // Text controllers
  var nameController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();

  // Error messages
  var nameError = ''.obs;
  var subjectError = ''.obs;
  var messageError = ''.obs;

  bool validate() {
    bool isValid = true;

    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Name cannot be empty';
      isValid = false;
    } else {
      nameError.value = '';
    }

    if (subjectController.text.trim().isEmpty) {
      subjectError.value = 'Subject cannot be empty';
      isValid = false;
    } else {
      subjectError.value = '';
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
