import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/controller/provider/newsDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SelectedNewsScreen extends StatefulWidget {
  const SelectedNewsScreen({super.key});

  @override
  State<SelectedNewsScreen> createState() => _SelectedNewsScreenState();
}

class _SelectedNewsScreenState extends State<SelectedNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Consumer<NewsDataProvider>(builder: (context, news, child) {
          if (news.selectedNews == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              children: [
                Text(
                  news.selectedNews!.title!,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Builder(builder: (context) {
                  if (news.selectedNews!.newsImageURL != null) {
                    return Container(
                      height: 30.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(news.selectedNews!.newsImageURL!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                    );
                  }
                }),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  news.selectedNews!.author ?? 'no author',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  news.selectedNews!.description!,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
