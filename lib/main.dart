import 'package:flutter/material.dart';
import 'package:news_app/controller/provider/newsDataProvider.dart';
import 'package:news_app/view/newsScreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MultiProvider(
          providers: [
ChangeNotifierProvider<NewsDataProvider>(create: (context)=> NewsDataProvider())

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            home: const NewsScreen(),
          ),
        );
      },
    );
  }
}
