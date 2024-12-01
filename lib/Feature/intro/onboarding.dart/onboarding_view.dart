import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/Core/Functions/Navigation.dart';
import 'package:se7ety/Core/Utils/Colors.dart';
import 'package:se7ety/Core/Utils/Text_Style.dart';
import 'package:se7ety/Core/Widgets/customButton.dart';
import 'package:se7ety/Core/service/local_storag/local_storage.dart';
import 'package:se7ety/Feature/intro/onboarding.dart/onboarding_model.dart';
import 'package:se7ety/Feature/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actions: [
          if (currentPage != 2)
            TextButton(
              onPressed: () {
                AppLocalStorage.CacheData(
                    key: AppLocalStorage.onBoarding, value: true);

                pushReplacement(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getBodyTextStyle(color: AppColors.primary),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          // pageview
          Expanded(
              child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(children: [
                // image
                const Spacer(),
                SvgPicture.asset(
                  pages[index].image,
                  width: 300,
                ),
                const Spacer(),
                // title
                Text(
                  pages[index].title,
                  style: getHeadLineTextStyle(color: AppColors.primary),
                ),
                const Gap(16),
                Text(
                  pages[index].body,
                  textAlign: TextAlign.center,
                  style: getBodyTextStyle(),
                ),
                const Spacer(
                  flex: 3,
                ),
              ]);
            },
            itemCount: pages.length,
          )),
          // footer
          SizedBox(
            height: 70,
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
                  effect: const SlideEffect(
                      spacing: 8.0,
                      radius: 15,
                      dotWidth: 24.0,
                      dotHeight: 13,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.primary),
                ),
                const Spacer(),
                if (currentPage == 2)
                  CustomButton(
                      height: 45,
                      text: 'هيا بنا',
                      onPressed: () {
                        AppLocalStorage.CacheData(
                            key: AppLocalStorage.onBoarding, value: true);
                        pushReplacement(context, const WelcomeView());
                      },
                      width: 100)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
