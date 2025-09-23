import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/Classes/links.dart';
import 'package:portfolio/Classes/projects.dart';
import 'package:simple_icons/simple_icons.dart';
import '../Classes/skills.dart';

class Controller extends GetxController {
  final List<Skills> skills = [
    Skills(skill: 'Flutter', icon: Icon(FontAwesomeIcons.flutter)),
    Skills(skill: 'Dart', icon: Icon(FontAwesomeIcons.dartLang)),
    Skills(skill: 'Django', icon: Icon(SimpleIcons.django)),
    Skills(skill: 'GetX', icon: Icon(FontAwesomeIcons.x)),
    Skills(skill: 'Python', icon: Icon(FontAwesomeIcons.python)),
    Skills(skill: 'RestApis', icon: Icon(SimpleIcons.swagger)),
    Skills(skill: 'Java', icon: Icon(FontAwesomeIcons.java)),
    Skills(skill: 'Git', icon: Icon(FontAwesomeIcons.git)),
    Skills(skill: 'Unity', icon: Icon(FontAwesomeIcons.unity)),
  ].obs;

  final List<Projects> projects = [
    Projects(
      title: 'Sahaay',
      description:
          'Sahaay connects students with qualified counselors for smart and accessible support',
      imageUrl: 'assets/image/projects_images/sahaay.jpg',
      link: 'https://github.com/PiyushSukh/sahaay',
    ),
    Projects(
      title: 'Weatherly',
      description:
          'Weatherly shows real-time weather updates quickly and easily.',
      imageUrl: 'assets/image/projects_images/weather.jpg',
      link: 'https://github.com/PiyushSukh/weatherly',
    ),
    Projects(
      title: 'Currency Converter',
      description: 'Convert USD to INR currency easily and quickly.',
      imageUrl: 'assets/image/projects_images/currency.jpg',
      link: 'https://github.com/PiyushSukh/currency_converter',
    ),
  ].obs;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    final linkController = Get.put(Links());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/image/profile.jpg'),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Piyush Sukhwani',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Mobile App Developer | Flutter & Django',
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'About Me',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'I’m Piyush Sukhwani, a passionate Mobile App Developer with experience in building modern, user-friendly applications using Flutter for the front end and Django for the back end. I enjoy creating clean, efficient, and scalable solutions that make an impact. With a strong interest in learning new technologies and improving my skills, I love turning ideas into real-world applications. Beyond coding, I enjoy exploring creative projects, collaborating with others, and continuously challenging myself to grow as a developer',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.dialog(
                          barrierDismissible: false,
                          AlertDialog(
                            title: Text('About Me'),
                            content: SingleChildScrollView(
                              child: Text(
                                "I’m Piyush Sukhwani, a passionate Mobile App Developer with experience in building modern, user-friendly applications using Flutter for the front end and Django for the back end. I enjoy creating clean, efficient, and scalable solutions that make an impact. With a strong interest in learning new technologies and improving my skills, I love turning ideas into real-world applications. Beyond coding, I enjoy exploring creative projects, collaborating with others, and continuously challenging myself to grow as a developer.",
                                style: TextStyle(fontSize: 16, height: 1.5),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('Read More'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Skills',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: Obx(() {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.skills.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),

                          child: SizedBox(
                            child: Card(
                              color: Colors.grey[700],
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: controller.skills[index].icon,
                                    ),
                                    Text(controller.skills[index].skill),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
                SizedBox(height: 30),
                Text(
                  'Projects',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: SizedBox(
                    child: Obx(() {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.projects.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),

                            child: SizedBox(
                              width: 170,
                              child: Card(
                                color: Colors.grey[700],
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 140,
                                        width: 100,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              controller
                                                  .projects[index]
                                                  .imageUrl,
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        controller.projects[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.projects[index].description,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Contact ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.github),
                      onPressed: () {
                        linkController.linkRedirect(
                          link: 'https://github.com/PiyushSukh',
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        linkController.linkRedirect(
                          link: 'https://www.linkedin.com/in/piyush-sukhwani/',
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.twitter),
                      onPressed: () {
                        linkController.linkRedirect(
                          link: 'https://x.com/SukhwaniPi3583',
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.envelope),
                      onPressed: () {
                        linkController.gmailRedirect(
                          path: 'piyushjaipur25@gmail.com',
                          subject: '',
                          body: '',
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
