import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synergy_flutter/components/movieTile.dart';

class Home extends StatefulWidget {
  @override
  _UpComingState createState() => _UpComingState();
}

class _UpComingState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/netflix.png",
                width: size.width * 0.25,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
            ]),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/watch.png",
                width: size.width * 0.25,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
            ]),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/movie.png",
                width: size.width * 0.25,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
              MovieTile(
                image:
                    'https://img1.daumcdn.net/thumb/C408x596/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fmovie%2Fe25f366dfc9a3429ad38b3a28b4fdf0621167351',
                title: "불가사리7",
                date: "21.04.23",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
