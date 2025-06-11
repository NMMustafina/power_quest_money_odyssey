import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/color_vddkmfv.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/dok_gdv.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/moti_tybsf.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/pro_iesdf.dart';

class Nvjd extends StatelessWidget {
  const Nvjd({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: false,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colordd.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                MotiButsdh(
                  onPressed: () {
                    lauchUrlJHSk(context, Doknsd.priPoli);
                  },
                  child: Image.asset(
                    'assets/images/1.png',
                    width: 160,
                    height: 160,
                  ),
                ),
                SizedBox(width: 16.w),
                MotiButsdh(
                  onPressed: () {
                    lauchUrlJHSk(context, Doknsd.suprF);
                  },
                  child: Image.asset(
                    'assets/images/2.png',
                    width: 160,
                    height: 160,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Spacer(),
                MotiButsdh(
                  onPressed: () {
                    lauchUrlJHSk(context, Doknsd.terOfUse);
                  },
                  child: Image.asset(
                    'assets/images/3.png',
                    width: 160,
                    height: 160,
                  ),
                ),
                SizedBox(width: 16.w),
                Opacity(
                  opacity: 0,
                  child: Image.asset(
                    'assets/images/3.png',
                    width: 160,
                    height: 160,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
