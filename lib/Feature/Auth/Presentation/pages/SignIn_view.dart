import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/Core/Functions/Navigation.dart';
import 'package:se7ety/Core/Functions/dialogs.dart';
import 'package:se7ety/Core/Functions/email_validate.dart';
import 'package:se7ety/Core/Utils/Colors.dart';
import 'package:se7ety/Core/Utils/Text_Style.dart';
import 'package:se7ety/Core/Widgets/customButton.dart';
import 'package:se7ety/Core/enums/User_type_enum.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_event.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_state.dart';
import 'package:se7ety/Feature/Auth/Presentation/pages/Register_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key, required this.userType});
  final UserType userType;

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;

  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pop(context);
        } else if (state is AuthErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else {
          ShowLoadingDialog(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 1),
                      Image.asset(
                        'Assets/logo.png',
                        height: 290,
                      ),
                      Text(
                        'سجل دخول الان كـ "${handleUserType()}"',
                        style: getHeadLineTextStyle(),
                      ),
                      const Gap(30),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          hintText: 'mahmoudmasoud862003@example.com',
                          prefixIcon: Icon(Icons.email_rounded),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل الايميل';
                          } else if (!emailValidate(value)) {
                            return 'من فضلك ادخل الايميل صحيحا';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Gap(30),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        textAlign: TextAlign.end,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                          hintText: '**************',
                          suffixIcon: IconButton(
                            icon: Icon(isVisible
                                ? Icons.remove_red_eye_rounded
                                : Icons.visibility_off_rounded),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                          prefixIcon: const Icon(Icons.lock_rounded),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل الباسورد';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "نسيت كلمة السر؟",
                            style: getSmallTextStyle(),
                          ),
                        ],
                      ),
                      const Gap(30),
                      CustomButton(
                        text: "تسجيل الدخول",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(LoginEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  userType: widget.userType,
                                ));
                          }
                        },
                        radius: 60,
                      ),
                      const Gap(45),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ليس لدي حساب ؟",
                            style: getBodyTextStyle(),
                          ),
                          TextButton(
                            onPressed: () {
                              pushReplacement(context,
                                  RegisterView(userType: widget.userType));
                            },
                            child: Text(
                              "سجل الان",
                              style: getBodyTextStyle(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}














































/*import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/Core/Functions/Navigation.dart';
import 'package:se7ety/Core/Functions/dialogs.dart';
import 'package:se7ety/Core/Functions/email_validate.dart';
import 'package:se7ety/Core/Utils/Colors.dart';
import 'package:se7ety/Core/Utils/Text_Style.dart';
import 'package:se7ety/Core/Widgets/customButton.dart';
import 'package:se7ety/Core/enums/User_type_enum.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_event.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_state.dart';
import 'package:se7ety/Feature/Auth/Presentation/pages/Register_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key, required this.userType});
  final UserType userType;

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisable = true;

  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
        } else if (state is AuthErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.error);
        } else {
          ShowLoadingDialog(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      'Assets/logo.png',
                      height: 290,
                    ),
                    Text(
                      'سجل دخول الان كـ "${handleUserType()}"',
                      style: getHeadLineTextStyle(),
                    ),
                    const Gap(30),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          hintText: 'mahmoudmasoud862003@example.com',
                          prefixIcon: Icon(Icons.email_rounded),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل الايميل';
                          } else if (!emailValidate(value)) {
                            return 'من فضلك ادخل الايميل صحيحا';
                          } else {
                            return null;
                          }
                        }),
                    const Gap(30),
                    TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          hintText: '**************',
                          suffixIcon: Icon(Icons.remove_red_eye_rounded),
                          prefixIcon: Icon(Icons.lock_rounded),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل الباسورد';
                          } else {
                            return null;
                          }
                        }),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "نسيت كلمة السر؟",
                          style: getSmallTextStyle(),
                        )
                      ],
                    ),
                    const Gap(30),
                    CustomButton(
                      text: "تسجيل الدخول",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(LoginEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                              UserType: widget.userType));
                        }
                      },
                      radius: 60,
                    ),
                    const Gap(45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ليس لدي حساب ؟",
                          style: getBodyTextStyle(),
                        ),
                        TextButton(
                            onPressed: () {
                              push(context,
                                  RegisterView(userType: (widget.userType)));
                            },
                            child: Text(
                              "سجل الان",
                              style: getBodyTextStyle(color: AppColors.primary),
                            )),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
