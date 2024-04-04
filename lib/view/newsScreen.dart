import 'package:flutter/material.dart';
import 'package:news_app/controller/provider/newsDataProvider.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/view/selectedNewsScreen.dart';
import 'package:news_app/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  fetchNewsData() {
    Provider.of<NewsDataProvider>(context, listen: false).fetchNewsData();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNewsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Top Headlines',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<NewsDataProvider>(builder: (context, newsProvider, child) {
        if (newsProvider.news.isEmpty) {
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
          return const LoadingWidget();
        } else {
          return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              itemCount: newsProvider.news.length,
              itemBuilder: (context, index) {
                NewsModel currentNews = newsProvider.news[index];
                return InkWell(
                  onTap: () {
                    Provider.of<NewsDataProvider>(context, listen: false)
                        .updateSelectedNews(currentNews);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectedNewsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Builder(builder: (context) {
                          if (currentNews.newsImageURL != null) {
                            return Container(
                              height: 18.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      currentNews.newsImageURL!,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            );
                          } else {
                            return Container(
                              height: 18.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }
                        }),
                        Text(
                          currentNews.title!,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Builder(builder: (context) {
                          if (currentNews.author != null) {
                            return Text(
                              currentNews.author!,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            );
                          } else {
                            return const Text(
                              'no author',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
