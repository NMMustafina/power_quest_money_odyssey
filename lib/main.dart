import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:power_quest_money_odyssey_278_t/adfretwweert/color_vddkmfv.dart';
import 'package:provider/provider.dart';

import 'adfretwweert/onb_rtsdf.dart';
import 'models/predefined_quests.dart';
import 'models/quest_model.dart';
import 'providers/quest_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(QuestCategoryAdapter());
  Hive.registerAdapter(QuestModelAdapter());

  final box = await Hive.openBox<QuestModel>('quests');
  if (box.isEmpty) {
    box.addAll(predefinedQuests);
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => QuestProvider(box),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Power',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colordd.background,
          ),
          scaffoldBackgroundColor: Colordd.background,
          // fontFamily: '-_- ??',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        home: const OnBoDiasdbvhjdjh(),
      ),
    );
  }
}
