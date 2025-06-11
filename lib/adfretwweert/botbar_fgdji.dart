import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/moti_tybsf.dart';
import 'package:power_quest_money_odyssey_278_t/fhhgj/fjgnb.dart';
import 'package:power_quest_money_odyssey_278_t/fhhgj/nrvnu.dart';
import 'package:power_quest_money_odyssey_278_t/fhhgj/nvjd.dart';

import '../screens/home_screen.dart';

class BotomBaasdf extends StatefulWidget {
  const BotomBaasdf({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<BotomBaasdf> createState() => BotomBaasdfState();
}

class BotomBaasdfState extends State<BotomBaasdf> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexScr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 80.h,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.only(
          left: 6,
          right: 6,
          top: 6,
          bottom: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff5E657E).withOpacity(0.5),
          borderRadius: BorderRadius.circular(40),
          // border: Border.all(
          //   color: const Color(0xffFFFFFF).withOpacity(0.1),
          // ),
          // border: Border(
          //     top: BorderSide(
          //   color: Color(0xff308AFF),
          // )),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: buildNavItem(
                0,
                'assets/icons/1.png',
                'assets/icons/11.png',
              ),
            ),
            Expanded(
              child: buildNavItem(
                1,
                'assets/icons/2.png',
                'assets/icons/22.png',
              ),
            ),
            Expanded(
              child: buildNavItem(
                2,
                'assets/icons/3.png',
                'assets/icons/33.png',
              ),
            ),
            Expanded(
              child: buildNavItem(
                3,
                'assets/icons/4.png',
                'assets/icons/44.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String iconPath, String ima2) {
    bool isActive = _currentIndex == index;

    return MotiButsdh(
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        // width: isActive ? 137.w : 60.w,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xff33BFEC) : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              _currentIndex == 0
                  ? 40
                  : _currentIndex == 1
                      ? 8
                      : _currentIndex == 2
                          ? 8
                          : _currentIndex == 3
                              ? 8
                              : _currentIndex == 4
                                  ? 8
                                  : 0,
            ),
            bottomLeft: Radius.circular(
              _currentIndex == 0
                  ? 40
                  : _currentIndex == 1
                      ? 8
                      : _currentIndex == 2
                          ? 8
                          : _currentIndex == 3
                              ? 8
                              : _currentIndex == 4
                                  ? 8
                                  : 0,
            ),
            topRight: Radius.circular(
              _currentIndex == 0
                  ? 8
                  : _currentIndex == 1
                      ? 8
                      : _currentIndex == 2
                          ? 8
                          : _currentIndex == 3
                              ? 40
                              : 0,
            ),
            bottomRight: Radius.circular(
              _currentIndex == 0
                  ? 8
                  : _currentIndex == 1
                      ? 8
                      : _currentIndex == 2
                          ? 8
                          : _currentIndex == 3
                              ? 40
                              : 0,
            ),
          ),
        ),
        // decoration: BoxDecoration(
        //   color: isActive ? Colordd.blue : Colors.white.withOpacity(0.0),
        //   borderRadius: BorderRadius.circular(14),
        // ),
        child: Center(
          child: Image.asset(
            iconPath,
            // width: 32.w,
            // height: 32.h,
            color: isActive ? null : const Color(0xffC9C9C9),
            // height: 61.h,
          ),
        ),
      ),
    );
  }

  final _pages = <Widget>[
    const HomeScreen(),
    const Nrvnu(),
    const Fjgnb(),
    const Nvjd(),
  ];
}
