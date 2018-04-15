import 'package:flutter/material.dart';
import 'package:we_rate_dogs/dog_detail_page.dart';
import 'package:we_rate_dogs/dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  DogCardState createState() {
    return new DogCardState(dog);
  }
}

class DogCardState extends State<DogCard> {
  Dog dog;
  String renderUrl;

  DogCardState(this.dog);

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    setState(() {
      renderUrl = dog.imageUrl;
    });
  }

  Widget get dogImage {
    var dogAvatar = new Hero(
      tag: dog,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(renderUrl ?? ''),
          ),
        ),
      ),
    );

    var placeholder = new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black54, Colors.black, Colors.blueGrey[600]],
          ),
        ),
        alignment: Alignment.center,
        child: new Text(
          'DOGGO',
          textAlign: TextAlign.center,
        ));

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  Widget get dogCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290.0,
        height: 115.0,
        child: new Card(
          color: Colors.black87,
          child: new Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(widget.dog.name,
                    style: Theme.of(context).textTheme.headline),
                new Text(widget.dog.location,
                    style: Theme.of(context).textTheme.subhead),
                new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.star,
                    ),
                    new Text(': ${widget.dog.rating} / 10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showDogDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              dogCard,
              new Positioned(top: 7.5, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new DogDetailPage(dog);
    }));
  }
}
