import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/Module/Project/TapBarCubit.dart';
import 'package:lms/Module/Them/cubit/app_color_cubit.dart';
import 'package:lms/Module/Them/cubit/app_color_state.dart';
class TabButtonsProject extends StatelessWidget {
  const TabButtonsProject({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeState appColors = context.watch<ThemeCubit>().state;
    final selectedTab = context.watch<TapbarcubitProject>().state;

    final labels = ['All', 'Web', 'Mobile', 'AI', 'Data', 'Favorite'];

    return Container(
      width: 200.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: BorderRadius.circular(5),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            labels.length,
            (index) {
              final isSelected = selectedTab == index;
        
              return GestureDetector(
                onTap: () => context.read<TapbarcubitProject>().changeTab(index),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: isSelected ? appColors.pageBackground : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.r),
                  ),  
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color: isSelected
                          ? appColors.mainText
                          : appColors.mainText,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

