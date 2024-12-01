import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/Core/Utils/theme.dart';
import 'package:se7ety/Core/service/local_storag/local_storage.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_bloc.dart';
import 'package:se7ety/Feature/intro/splash_view.dart';
import 'package:se7ety/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.LightTheme,
        home: SplashView(),
        builder: (context, child) {
          return Directionality(
              textDirection: TextDirection.rtl, child: child!);
        },
      ),
    );
  }
}
