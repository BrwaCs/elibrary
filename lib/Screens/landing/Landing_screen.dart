import 'package:elibrary/Auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final controller = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LiquidSwipe(
          liquidController: controller,
          enableSideReveal: true,
          onPageChangeCallback: (index) {
            setState(() {});
          },
          slideIconWidget: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          pages: [
            biuldPage(
                color: Color.fromARGB(255, 0, 0, 32),
                urlImage: "assets/images/land1.png",
                title: "Book",
                subTitle:
                    "Non minim ad Lorem voluptate enim fugiat cillum veniam esse elit incididunt occaecat. Veniam duis aute ipsum velit culpa sint pariatur ut officia id duis et eu Lorem. Voluptate anim minim consectetur laborum in labore laborum ipsum quis ut."),
            biuldPage(
                color: Color.fromARGB(255, 1, 26, 166),
                urlImage: "assets/images/land2.png",
                title: "Category",
                subTitle:
                    "Non minim ad Lorem voluptate enim fugiat cillum veniam esse elit incididunt occaecat. Veniam duis aute ipsum velit culpa sint pariatur ut officia id duis et eu Lorem. Voluptate anim minim consectetur laborum in labore laborum ipsum quis ut."),
            biuldPage(
                color: Color.fromARGB(255, 33, 177, 226),
                urlImage: "assets/images/land4.png",
                title: "Author",
                subTitle:
                    "Non minim ad Lorem voluptate enim fugiat cillum veniam esse elit incididunt occaecat. Veniam duis aute ipsum velit culpa sint pariatur ut officia id duis et eu Lorem. Voluptate anim minim consectetur laborum in labore laborum ipsum quis ut."),
          ],
        ),
        Positioned(
            bottom: 6,
            left: 16,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => Auth());
                    },
                    child: Text(
                      "SKIP",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage,
                  count: 3,
                  effect: const WormEffect(
                      spacing: 24,
                      dotColor: Colors.white54,
                      activeDotColor: Colors.white),
                  onDotClicked: (index) {
                    controller.animateToPage(page: index);
                  },
                ),
                TextButton(
                    onPressed: () {
                      final page = controller.currentPage + 1;
                      if (page > 2) {
                        Get.to(() => Auth());
                      } else {
                        controller.animateToPage(page: page, duration: 400);
                      }
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ],
            )),
      ],
    ));
  }

  Widget biuldPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subTitle,
  }) {
    final x = Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(urlImage, fit: BoxFit.cover, width: double.infinity),
            const SizedBox(
              height: 40,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            const SizedBox(height: 24),
            Text(
              subTitle,
              style: TextStyle(
                  height: 1.2,
                  wordSpacing: 1.2,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
    return x;
  }
}
