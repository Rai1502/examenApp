import 'package:card_swiper/card_swiper.dart';
import 'package:examen_app/src/models/models.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Noticias> noticias;

  const CardSwiper({
    Key? key,
    required this.noticias,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(noticias.length);
    if (noticias.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.2),
      width: double.infinity,
      height: size.height * 0.5,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Noticias",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Swiper(
            itemCount: noticias.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.4,
            itemBuilder: (_, int index) {
              final noticia = noticias[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: AssetImage("assets/jar-loading.gif"),
                        image: NetworkImage(
                            "https://cencelgo.s3.amazonaws.com/newsPath/857B847A30084236.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    noticia.titulo!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
