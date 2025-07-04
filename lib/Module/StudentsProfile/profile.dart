import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/Constant/images.dart';
import 'package:lms/Module/Courses/TapBarCubit.dart';
import 'package:lms/Module/StudentsProfile/gridViewProfile.dart';
import 'package:lms/Module/StudentsProfile/profileState.dart';
import 'package:lms/Module/mainWidget/Container.dart';
import 'package:lms/Module/mainWidget/TabButtons.dart';
import 'package:lms/Module/mainWidget/authText.dart';
import 'package:lms/Module/Them/cubit/app_color_cubit.dart';
import 'package:lms/Module/Them/cubit/app_color_state.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabCubitProfile>(
      create: (_) => TabCubitProfile(),
      child: Builder(
        builder: (context) {
          ThemeState appColors = context.watch<ThemeCubit>().state;

          return Scaffold(
            backgroundColor: appColors.pageBackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                    Stack(
                      children: [
                        Image.asset(
                          Images.courses,
                          width: double.infinity,
                          height: 380,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h, right: 15.w),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: OnBordingContainer(
                              width: 90,
                              height: 25,
                              color: appColors.darkText,
                              widget: AuthText(
                                text: 'Edit Profile',
                                size: 14,
                                color: appColors.mainText,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OnBordingContainer(
                                  width: 220,
                                  height: 68,
                                  color: appColors.primary,
                                  widget: Column(
                                    children: [
                                      AuthText(
                                        text: 'Tayseer Matar',
                                        size: 24,
                                        color: appColors.mainText,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      SizedBox(height: 5.h),
                                      AuthText(
                                        text: 'email@gmail.com',
                                        size: 14,
                                        color: appColors.pageBackground,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  children: [
                                    OnBordingContainer(
                                      width: 110,
                                      height: 35,
                                      color: appColors.orang,
                                      widget: Align(
                                        alignment: Alignment.center,
                                        child: AuthText(
                                          text: 'Intermidiate',
                                          size: 12,
                                          color: appColors.mainText,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    OnBordingContainer(
                                      width: 110,
                                      height: 30,
                                      color: appColors.darkText,
                                      widget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            Images.github,
                                            height: 20.h,
                                            width: 20.w,
                                            color: appColors.mainText,
                                          ),
                                          SizedBox(width: 15.w),
                                          AuthText(
                                            text: 'GitHub',
                                            color: appColors.mainText,
                                            size: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Profilestate(title: 'Current Streak', value: '12 Days'),
                        Profilestate(title: 'Course Completed', value: '5'),
                        Profilestate(title: 'Path Completed', value: '20'),
                        Profilestate(title: 'Total Points', value: '2578'),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TabButtonsProfile(),
                  BlocBuilder<TabCubitProfile, int>(
                    builder: (context, state) {
                      switch (state) {
                        case 0:
                          return Gridviewprofile();
                        case 1:
                          return _buildSimpleTab(
                              context, 'In Progress Content');
                        case 2:
                          return _buildSimpleTab(context, 'Completed Content');
                        case 3:
                          return _buildSimpleTab(context, 'Watchlater Content');
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSimpleTab(BuildContext context, String text) {
    ThemeState appColors = context.watch<ThemeCubit>().state;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Text(
          text,
          style: TextStyle(
            color: appColors.mainText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
