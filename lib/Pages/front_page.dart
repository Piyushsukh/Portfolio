import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/Pages/contact_me.dart';
import 'package:portfolio/Pages/home_screen.dart';
import 'package:portfolio/Pages/projects.dart';

class IndexController extends GetxController {
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final _pages = const [HomeScreen(), Projects(), ContactMe()].obs;
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    IndexController indexController = Get.put(IndexController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: indexController.selectedIndex.value,
          children: indexController._pages,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.black,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.house),
                    color: indexController.selectedIndex.value == 0
                        ? Colors.white
                        : Colors.grey,
                    onPressed: () {
                      indexController.changeIndex(0);
                    },
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: indexController.selectedIndex.value == 0
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.laptopCode),
                    color: indexController.selectedIndex.value == 1
                        ? Colors.white
                        : Colors.grey,
                    onPressed: () {
                      indexController.changeIndex(1);
                    },
                  ),
                  Text(
                    "Projects",
                    style: TextStyle(
                      color: indexController.selectedIndex.value == 1
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.phone),
                    color: indexController.selectedIndex.value == 2
                        ? Colors.white
                        : Colors.grey,
                    onPressed: () {
                      indexController.changeIndex(2);
                    },
                  ),
                  Text(
                    "Contact Me",
                    style: TextStyle(
                      color: indexController.selectedIndex.value == 2
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
