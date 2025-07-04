import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/Helper/cach_helper.dart';
import 'package:lms/Module/Auth/cubit/auth_cubit.dart';
import 'package:lms/Module/LearnPathInfo/LearnPathInfoPage.dart';
import 'package:lms/Module/NavigationBarWidged/navigationBarWidget.dart';
import 'package:lms/Module/PaidCourseInfo/PaidCourseInfoPage.dart';
import 'package:lms/Module/PercentIndicator/PercentIndicatorPage.dart';
import 'package:lms/Module/Project/projectPage.dart';
import 'package:lms/Module/TeacherProfile/teacherProfilePage.dart';
import 'package:lms/Module/Test/TestPage.dart';
import 'package:lms/Module/Them/cubit/app_color_cubit.dart';
import 'package:lms/Module/Them/cubit/app_color_state.dart';
import 'package:lms/Module/Vedio/VideoScreen.dart';
import 'package:lms/Module/leaderboardforpastcontest/leaderboardforpastcontestPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: VideoScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
