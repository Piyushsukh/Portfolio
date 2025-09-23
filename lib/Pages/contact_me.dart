import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Classes/contactMe.dart';
import 'package:portfolio/Classes/links.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final SocialMediaController socialMediaController = Get.put(
      SocialMediaController(),
    );
    final ContactController contactController = Get.put(ContactController());
    final linkController = Get.find<Links>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Me"),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Get in Touch',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: Obx(() {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: socialMediaController.social.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (socialMediaController.social[index].name ==
                              'Gmail') {
                            linkController.gmailRedirect(
                              path: 'piyushjaipur25@gmail.com',
                              subject: '',
                              body: '',
                            );
                          } else {
                            linkController.linkRedirect(
                              link: socialMediaController.social[index].url,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[900],
                          ),
                          child: Icon(
                            socialMediaController.social[index].icon,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 30),

              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: contactController.nameController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[800],
                        filled: true,
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    if (contactController.nameError.value.isNotEmpty)
                      Text(
                        contactController.nameError.value,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: contactController.subjectController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[800],
                        filled: true,
                        hintText: 'Subject',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    if (contactController.subjectError.value.isNotEmpty)
                      Text(
                        contactController.subjectError.value,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: contactController.messageController,
                      cursorColor: Colors.white,
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[800],
                        filled: true,
                        hintText: 'Enter your message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    if (contactController.messageError.value.isNotEmpty)
                      Text(
                        contactController.messageError.value,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              TextButton(
                onPressed: () {
                  if (contactController.validate()) {
                    linkController.gmailRedirect(
                      path: socialMediaController.social[2].url,
                      subject: contactController.subjectController.text.trim(),
                      body: contactController.messageController.text.trim(),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Send Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
