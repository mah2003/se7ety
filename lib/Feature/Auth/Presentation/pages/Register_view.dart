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
import 'package:se7ety/Feature/Auth/Presentation/pages/SignIn_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.userType});
  final UserType userType;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isVisable = true;

  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pop(context);
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          } else if (state is RegisterLoadingState) {
            ShowLoadingDialog(context);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Add this key to your Form widget
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30), // Use SizedBox for spacing
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
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: 'الاسم',
                        prefixIcon: Icon(Icons.person_rounded),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل الاسم';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(30),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                        hintText: '*************@example.com',
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
                      obscureText: isVisable,
                      decoration: InputDecoration(
                        hintText: '***************',
                        prefixIcon: Icon(Icons.lock_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisable ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل الباسورد';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(30),
                    CustomButton(
                      text: "تسجيل حساب",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(RegisterEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
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
                          "لدي حساب ؟",
                          style: getBodyTextStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            pushReplacement(
                                context, SigninView(userType: widget.userType));
                          },
                          child: Text(
                            "سجل الان",
                            style: getBodyTextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60), // Use SizedBox for spacing
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


















































/*import 'package:flutter/material.dart';
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
import 'package:se7ety/Feature/Auth/Presentation/pages/SignIn_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.userType});
  final UserType userType;

  @override
  State<RegisterView> createState() => _SigninViewState();
}

class _SigninViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isVisable = true;

  String handleUserType() {
    return widget.userType == UserType.doctor ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),

      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pop(context);
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          } else if (state is RegisterLoadingState) {
            ShowLoadingDialog(context);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'الاسم',
                          prefixIcon: Icon(Icons.person_rounded),
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
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textAlign: TextAlign.end,
                        decoration: const InputDecoration(
                          hintText: '*************@example.com',
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
                            hintText: '***************',
                            prefixIcon: Icon(Icons.lock_rounded),
                            suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'من فضلك ادخل الباسورد';
                          } else {
                            return null;
                          }
                        }),
                    const Gap(30),
                    CustomButton(
                      text: "تسجيل حساب",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(RegisterEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              userType: widget.userType));
                        }
                      },
                      radius: 60,
                    ),
                    const Gap(45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "لدي حساب ؟",
                          style: getBodyTextStyle(),
                        ),
                        TextButton(
                            onPressed: () {
                              push(context,
                                  SigninView(userType: widget.userType));
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
}
*/