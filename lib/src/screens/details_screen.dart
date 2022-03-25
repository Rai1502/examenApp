import 'package:examen_app/src/models/models.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Noticias noticia =
        ModalRoute.of(context)!.settings.arguments as Noticias;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(noticia: noticia),
        SliverList(
          delegate: SliverChildListDelegate([
            _PostertitleAndDate(noticia: noticia),
            _NewsText(noticia: noticia),
            _InfoArea(noticia: noticia),
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Noticias noticia;
  const _CustomAppBar({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: false,
      pinned: true, //para que no desaparezca nunca
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            noticia.titulo!,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKsuXu3I4xPH4O_u7dZMvyeeJ78So_XAo8Pg&usqp=CAU"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PostertitleAndDate extends StatelessWidget {
  final Noticias noticia;
  const _PostertitleAndDate({Key? key, required this.noticia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage(
                  "https://nubek.com.mx/assets/img/portfolio/CencelGo.png"),
              height: 100,
            ),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(noticia.titulo!,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text(noticia.expDate!,
                    style: textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsText extends StatelessWidget {
  final Noticias noticia;

  const _NewsText({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        noticia.texto!,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _InfoArea extends StatelessWidget {
  final Noticias noticia;

  const _InfoArea({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 245,
      child: Column(
        children: [
          Text(
            "Información Restante de la Noticia:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          SizedBox(height: 10),
          _RowCustom(
              text1: "Id: ${noticia.id}", text2: "status: ${noticia.status}"),
          _RowCustom(
              text1: "Heigth: ${noticia.height}",
              text2: "Width: ${noticia.width}"),
          _RowCustom(text1: "UrlImagen: ${noticia.urlImagen}"),
          _RowCustom(text1: "UrlVideo: ${noticia.urlVideo}"),
        ],
      ),
    );
  }
}

class _RowCustom extends StatelessWidget {
  final String text1;
  final String? text2;
  const _RowCustom({
    Key? key,
    required this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
        Text(
          text2 ?? "",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
