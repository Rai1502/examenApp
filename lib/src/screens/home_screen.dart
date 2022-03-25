import 'package:examen_app/src/widgets/card_swiper.dart';
import 'package:examen_app/src/widgets/news_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/news_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("News"),
          ),
          elevation: 10,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [NewsSlider(noticias: newsProvider.ondisplayNoticias)],
          ),
        ));
  }
}
