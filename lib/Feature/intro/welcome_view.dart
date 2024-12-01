import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/Core/Functions/Navigation.dart';
import 'package:se7ety/Core/Utils/Colors.dart';
import 'package:se7ety/Core/Utils/Text_Style.dart';
import 'package:se7ety/Core/enums/User_type_enum.dart';
import 'package:se7ety/Feature/Auth/Presentation/pages/Register_view.dart';
import 'package:se7ety/Feature/Auth/Presentation/pages/SignIn_view.dart';
//import 'package:se7ety/Feature/Auth/Presentation/SignIn_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          // Opacity(
          //   opacity: .7,
          //   child: Image.asset(
          //     'assets/welcome-bg.png',
          //     fit: BoxFit.cover,
          //     height: double.infinity,
          //     width: double.infinity,
          //   ),
          // ),
          Image.asset(
            'Assets/welcome-bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            // padding: const EdgeInsets.only(top: 100, right: 25),
            top: 100,
            right: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اهلا بيك',
                  style: getHeadLineTextStyle(fontsize: 38),
                ),
                const Gap(15),
                Text(
                  'سجل واحجز عند دكتورك وانت فالبيت',
                  style: getBodyTextStyle(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 25,
            right: 25,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'سجل دلوقتي كــ',
                    style: getBodyTextStyle(
                        fontsize: 18, color: AppColors.background),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          push(
                              context,
                              SigninView(
                                userType: UserType.patient,
                              ));
                        },
                        child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.background.withOpacity(.7),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'دكتور',
                                style: getHeadLineTextStyle(
                                    color: AppColors.black),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          push(
                              context,
                              SigninView(
                                userType: UserType.patient,
                              ));
                        },
                        child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                                color: AppColors.background.withOpacity(.7),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'مريض',
                                style: getHeadLineTextStyle(
                                    color: AppColors.black),
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
