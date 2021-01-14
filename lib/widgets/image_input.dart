import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as sys;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function onselectImage;

  ImageInput(this.onselectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final image = await ImagePicker()
        .getImage(source: ImageSource.camera, maxWidth: 600, maxHeight: 600);

    if (image == null) return;

    setState(() {
      _storedImage = File(image.path);
    });

    File imagefile = File(image.path);

    final appDir = await sys.getApplicationDocumentsDirectory();
    final filename = path.basename(_storedImage.path);
    print('A $appDir.path');
    print('B $filename');
    final savedImage = await imagefile.copy('${appDir.path}/$filename');
    widget.onselectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Center(
                  child: Text(
                  "No image taken",
                  textAlign: TextAlign.center,
                )),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
          ),
        )
      ],
    );
  }
}
