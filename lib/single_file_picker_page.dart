import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class SingleFilePickerPage extends StatefulWidget {
  const SingleFilePickerPage({Key? key}) : super(key: key);

  @override
  _SingleFilePickerPageState createState() => _SingleFilePickerPageState();
}

class _SingleFilePickerPageState extends State<SingleFilePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
               child: Text("single Picker"),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    final file = result.files.single;
                    openFile(file);
                    
                    print("name : ${file.name}");
                    print("Bytes : ${file.bytes}");
                    print("name : ${file.size}");
                    print("Extension : ${file.extension}");
                    print("Path : ${file.path}");
                    
                   final newFile =  await saveFilePermanently(file);

                    print("From Path : ${file.path}");
                    print("To Path : ${newFile.path}");

                  } else {
                    // User canceled the picker
                  }
                })

          ],
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {

    OpenFile.open(file.path);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    Directory appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");

    return File(file.path!).copy(newFile.path);
  }
}
