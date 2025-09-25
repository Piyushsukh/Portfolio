import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/Pages/contact_me.dart';
import 'package:portfolio/Pages/home_screen.dart';
import 'package:portfolio/Pages/projects.dart';

class IndexController extends GetxController {
  final selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final _pages = const [HomeScreen(), Projects(), ContactMe()].obs;
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final indexController = Get.put(IndexController());
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
              _buildNavBar(
                text: 'Home',
                index: 0,
                indexController: indexController,
                icon: const Icon(FontAwesomeIcons.house),
              ),
              _buildNavBar(
                text: 'Projects',
                index: 1,
                indexController: indexController,
                icon: const Icon(FontAwesomeIcons.laptopCode),
              ),
              _buildNavBar(
                text: 'Contact Me',
                index: 2,
                indexController: indexController,
                icon: const Icon(FontAwesomeIcons.phone),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavBar({
    required String text,
    required int index,
    required IndexController indexController,
    required Icon icon,
  }) {
    return Column(
      children: [
        IconButton(
          icon: icon,
          color: indexController.selectedIndex.value == index
              ? Colors.white
              : Colors.grey,
          onPressed: () {
            indexController.changeIndex(index);
          },
        ),
        Text(
          text,
          style: TextStyle(
            color: indexController.selectedIndex.value == index
                ? Colors.white
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}
