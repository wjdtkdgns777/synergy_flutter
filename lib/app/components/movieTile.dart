import 'package:flutter/material.dart';

class MovieTile extends StatefulWidget {
  const MovieTile({
    Key key,
    this.image,
    this.title,
    this.date,
    this.press,
  }) : super(key: key);

  final String image, title, date;

  final Function press;

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool selected = false;
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Image.network(widget.image),
          ),
          GestureDetector(
            onTap: widget.press,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    color: Colors.blueGrey.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "${widget.title}\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "${widget.date}".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: selected
                          ? Icon(Icons.add_alert)
                          : Icon(Icons.add_alert_outlined),
                      onPressed: () {
                        setState(() {
                          // Here we changing the icon.
                          selected = !selected;
                        });
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
