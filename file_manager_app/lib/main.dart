import 'dart:io';

import 'package:file_manager/controller/file_manager_controller.dart';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FileManagerController controller = FileManagerController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      /*
          AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)),
      */
      body: FileManager(
        controller: controller,
        builder: (BuildContext context, List<FileSystemEntity> snapshot) {
          final List<FileSystemEntity> entities = snapshot;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: entities.length,
            itemBuilder: (BuildContext context, int index) {
              FileSystemEntity entity = entities[index];
              return Card(
                child: ListTile(
                  leading: FileManager.isFile(entity)
                      ? Icon(Icons.feed_outlined)
                      : Icon(Icons.folder),
                  title: Text(
                    FileManager.basename(entity, showFileExtension: true),
                  ),
                  subtitle: subTitle(entity),
                  onTap: () {
                    if (FileManager.isDirectory(entity)) {
                      controller.openDirectory(entity);
                    } else {}
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            FileManager.requestFilesAccessPermission();
            //Permission.storage.request();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => MyHomePage(title: "File Manager")),
                (route) => false);
          },
          label: Text("Request File AccessPermission")),
    );
  }

  appBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () => createFolder(context),
            icon: Icon(Icons.create_new_folder_outlined)),
        IconButton(
            onPressed: () => sort(context), icon: Icon(Icons.sort_rounded)),
        IconButton(
            onPressed: () => SelectStorage(context),
            icon: Icon(Icons.sd_storage_rounded))
      ],
      title: ValueListenableBuilder(
        valueListenable: controller.titleNotifier,
        builder: (BuildContext context, String value, Widget? child) {
          return Text(value);
        },
      ),
      leading: IconButton(
          onPressed: () async {
            await controller.goToParentDirectory();
          },
          icon: Icon(Icons.arrow_back)),
    );
  }

  createFolder(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var folderCreate = TextEditingController();
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: TextField(
                    controller: folderCreate,
                    decoration: InputDecoration(labelText: 'Folder Name'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      String currentPath = controller.getCurrentPath;

                      String newFolderPath =
                          currentPath + '/' + folderCreate.text;

                      Directory(newFolderPath).createSync();

                      controller.openDirectory(
                          Directory(newFolderPath)); // Pass Directory object

                      Navigator.pop(context);
                    } catch (e) {
                      print('Error creating folder: $e');
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Create Folder"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  sort(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          var folderCreate = TextEditingController();
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Name"),
                    onTap: () {
                      controller.sortBy(SortBy.name);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("Size"),
                    onTap: () {
                      controller.sortBy(SortBy.size);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("Date"),
                    onTap: () {
                      controller.sortBy(SortBy.date);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("type"),
                    onTap: () {
                      controller.sortBy(SortBy.type);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  SelectStorage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: FutureBuilder<List<Directory>>(
            future: FileManager.getStorageList(),
            builder: (context, snapshot) {
              final List<FileSystemEntity> storageList = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: storageList
                    .map((e) => ListTile(
                          title: Text("${FileManager.basename(e)}"),
                          onTap: () {
                            controller.openDirectory(e);
                            Navigator.pop(context);
                          },
                        ))
                    .toList(),
              );
            },
          ),
        );
      },
    );
  }

  subTitle(FileSystemEntity entity) {
    return FutureBuilder(
      future: entity.stat(),
      builder: (BuildContext context, AsyncSnapshot<FileStat> snapshot) {
        if (snapshot.hasData) {
          if (entity is File) {
            int size = snapshot.data!.size;
            return Text("${FileManager.formatBytes(size)}");
          }
          return Text("${snapshot.data!.modified}");
        } else {
          return Text(" _ ");
        }
      },
    );
  }
}
