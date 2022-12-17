//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class PhotoHeroAnimEx extends StatelessWidget
{
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHeroAnimEx({Key key,  this.photo,  this.onTap,  this.width}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );

  }

}
class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PhotoHeroAnimEx(
          photo: 'assets/tops1.png',
          width: 300.0,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Aquaman transition'),
                  backgroundColor: Colors.green,
                ),
                body: Container(
                  // background of 2nd route
                  color: Colors.purple,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: Hero(
                    child:PhotoHeroAnimEx(

                      photo: 'assets/tops1.png',
                      width: 100.0,
                      onTap: () {
                        Navigator.of(context).pop();
                      },

                    ) ,

                  ),
                  /* child: PhotoHero(
                    photo: 'assets/images/aquaman.png',
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),*/
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}void main() {
  runApp(const MaterialApp(home: HeroAnimation()));
}