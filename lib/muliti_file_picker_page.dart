import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_file_picker_flutter/files_page.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class MultiFilePickerPage extends StatefulWidget {
  const MultiFilePickerPage({Key? key}) : super(key: key);

  @override
  _MultiFilePickerPageState createState() => _MultiFilePickerPageState();
}

class _MultiFilePickerPageState extends State<MultiFilePickerPage> {
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
                child: Text("mutli Picker"),
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.custom,
                      allowedExtensions: ["pdf" ,"mp4"]
                  );


                  if (result == null) return;

                  openFiles(result.files);


                })

          ],
        ),
      ),
    );
  }


  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context)=> FilesPage(
          files:files,
          onOpenFile: openFile,
        ),
    ));
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

}

