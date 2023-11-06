// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/assets.dart';
import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:coding_challenge/core/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBlueContainer extends StatelessWidget {
  const CustomBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CustomPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.genImagesPerson),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                SizedX.w3,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Jhon',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedX.h0p5,
                    Text(
                      'What are your plans \nfor today?',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w100,
                            height: 0.13.h,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
