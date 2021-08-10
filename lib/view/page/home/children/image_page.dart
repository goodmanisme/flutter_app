import 'package:flutter/material.dart';
import 'package:flutter_app/view/components/image_card.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: 16,
            ),
            ImageCard(),
          ],
        );
      },
    );
  }
}
