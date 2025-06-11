import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/botbar_fgdji.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/color_vddkmfv.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/moti_tybsf.dart';

class OnBoDiasdbvhjdjh extends StatefulWidget {
  const OnBoDiasdbvhjdjh({super.key});

  @override
  State<OnBoDiasdbvhjdjh> createState() => _OnBoDiasdbvhjdjhState();
}

class _OnBoDiasdbvhjdjhState extends State<OnBoDiasdbvhjdjh> {
  final PageController _controller = PageController();
  int introIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colordd.background,
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                introIndex = index;
              });
            },
            children: const [
              OnWid(
                image: '1',
              ),
              OnWid(
                image: '2',
              ),
              OnWid(
                image: '3',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 670.h),
            child: MotiButsdh(
              onPressed: () {
                if (introIndex != 2) {
                  _controller.animateToPage(
                    introIndex + 1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BotomBaasdf(),
                    ),
                    (protected) => false,
                  );
                }
              },
              child: Container(
                height: 55,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  // gradient: const LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: [
                  //     Color(0xffFC466C),
                  //     Color(0xffF31BAA),
                  //   ],
                  // ),
                  color: const Color(0xff33BFEC),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    introIndex != 2 ? 'Continue' : 'Start',
                    style: TextStyle(
                      color: Colordd.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnWid extends StatelessWidget {
  const OnWid({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/on$image.png',
      height: 812.h,
      width: 305.w,
      fit: BoxFit.cover,
      // alignment: Alignment.bottomCenter,
    );
  }
}
