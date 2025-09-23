import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Classes/contactMe.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final SocialMediaIcon iconController = Get.put(SocialMediaIcon());
    final ContactController contactController = Get.put(ContactController());
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
                    itemCount: iconController.icon.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[900],
                          ),
                          child: Icon(iconController.icon[index]),
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
                      controller: contactController.emailController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[800],
                        filled: true,
                        hintText: 'Email',
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
                    if (contactController.emailError.value.isNotEmpty)
                      Text(
                        contactController.emailError.value,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Message Field
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
                    Get.snackbar(
                      'Success',
                      'Message sent successfully!',
                      snackPosition: SnackPosition.BOTTOM,
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
