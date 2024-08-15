import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/styles/app_colors.dart';
import '../../bloc/home_bloc.dart';

class HomeTopLocationWidget extends StatelessWidget {
  const HomeTopLocationWidget({super.key, required this.state, this.notificationPressed});
  final HomeState state;
  final VoidCallback? notificationPressed;

  @override
  Widget build(BuildContext context) {

    return      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Location",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.brown,
                ),
                DropdownButton<String>(
                  value: state.selectedValue.isEmpty ? null : state.selectedValue,
                  hint: const Text('Select an option'),
                  underline: const SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(35.r),
                  items: <String>['New York', 'Milan', 'Spain'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      context.read<HomeBloc>().add(
                        LocationSelecting(newValue),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
        MaterialButton(
          onPressed: notificationPressed,
          shape: const CircleBorder(),
          color: Colors.grey.shade200,
          child: const Icon(Icons.notification_important_outlined),
        )
      ],
    );
  }
}
