import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:synergy_flutter/app/components/movieTile.dart';

import 'home_controller.dart';

class HomePage extends View {
  @override
  _HomePageState createState() => _HomePageState(HomeController());
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController controller) : super(controller);

  @override
  Widget get view => Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
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
      ));
}
