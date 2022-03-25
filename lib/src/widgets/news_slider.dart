import 'package:flutter/material.dart';

import '../models/models.dart';

class NewsSlider extends StatelessWidget {
  final List<Noticias> noticias;

  const NewsSlider({
    Key? key,
    required this.noticias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.27),
      width: double.infinity,
      height: 280,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Noticias",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: noticias.length,
            itemBuilder: (_, int index) => _NewsPoster(
              noticias: noticias[index],
            ),
          ),
        ),
      ]),
    );
  }
}

class _NewsPoster extends StatelessWidget {
  final Noticias noticias;
  const _NewsPoster({Key? key, required this.noticias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details_screen",
                arguments: noticias),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/no-image.jpg"),
                image: NetworkImage(
                    "https://nubek.com.mx/assets/img/portfolio/CencelGo.png"),
                // imageErrorBuilder: (context, error, stackTrace) {
                //   return Container(
                //       width: 130,
                //       height: 190,
                //       margin: const EdgeInsets.symmetric(
                //           horizontal: 10, vertical: 10),
                //       child: GestureDetector(
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(20),
                //           child: FadeInImage(
                //             placeholder: AssetImage("assets/no-image.jpg"),
                //             image: NetworkImage(
                //                 "https://nubek.com.mx/assets/img/portfolio/CencelGo.png"),
                //             width: 130,
                //             height: 190,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       ));
                // },
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            noticias.titulo!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
