import 'dart:io';
import 'package:places_app/providers/places.dart';
import 'package:places_app/widgets/location_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:places_app/widgets/image_input.dart';

class AddPlaces extends StatefulWidget {
  static const routename = '/addplaces';
  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final _titleController = TextEditingController();
  File _pickedImage;
  void _selectImage(File image) {
    _pickedImage = image;
  }

  void _savePlace() {
    print('C ${_titleController.text} $_pickedImage');
    if (_titleController.text.isEmpty || _pickedImage == null) return;
    Provider.of<Places>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 15,
                    ),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            color: Theme.of(context).accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text('Add location'),
            onPressed: _savePlace,
            elevation: 0,
          )
        ],
      ),
    );
  }
}
