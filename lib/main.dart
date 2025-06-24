import 'package:flutter/material.dart';
import 'package:movie_streaming_app/core/utils/constants.dart';
import 'package:movie_streaming_app/features/home/views/home_screen.dart';
import 'common_widgets/screen_size.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    SizeConfig.init(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      theme: ThemeData(fontFamily: "Inter", textTheme: textTheme),
      home: HomeScreen(),
    );
  }
}


