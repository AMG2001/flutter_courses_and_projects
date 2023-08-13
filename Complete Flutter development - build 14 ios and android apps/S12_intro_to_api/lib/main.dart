import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Updated to Key? key

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Updated to Key? key

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio dio = Dio();
  List<Map<String, dynamic>> comments = [];
  bool dataFetched = false;

  @override
  void initState() {
    if (dataFetched == false) {
      // Todo get comments.
      dio.get('https://jsonplaceholder.typicode.com/comments').then((response) {
        response.data.forEach((comment) {
          comments.add({
            'name': comment['name'],
            'body': comment['body'],
            'email': comment['email']
          });
        });
        dataFetched = true;
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("API")),
        body: dataFetched == false
            ? Center(
                child: CircularProgressIndicator(color: Colors.deepPurple),
              )
            : CustomReordableListView(list: comments));
  }

  Widget CustomReordableListView({required List<dynamic> list}) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return CustomPopupMenuWidget(
            publicContext: context,
            child: ListTile(
              key: Key(index.toString()),
              leading: Icon(Icons.comment_bank_outlined),
              title: Text(list[index]['name']),
              subtitle: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list[index]['email']),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    list[index]['body'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            optionsTitles: [
              'Action 1',
              "Action 2",
              "Action 3"
            ],
            functions: [
              () {
                print('Action 1');
              },
              () {
                print('Action 2');
              },
              () {
                print('Action 3');
              }
            ]);
      },
    );
  }
}

Widget CustomPopupMenuWidget(
    {required Widget child,
    required BuildContext publicContext,
    required List<String> optionsTitles,
    required List<Function()> functions}) {
  Offset tapPosition = Offset.zero; // Initialize tapPosition
  List<PopupMenuEntry<String>> popupMenuActions = [];
  for (int i = 0; i < optionsTitles.length; i++) {
    popupMenuActions.add(
      PopupMenuItem(
        value: '${optionsTitles[i]}',
        child: Text('${optionsTitles[i]}'),
        onTap: () {
          functions[i]();
        },
      ),
    );
  }

  return StatefulBuilder(builder: (context, setState) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            tapPosition = details.globalPosition; // Directly use globalPosition
          });
        },
        onLongPress: () async {
          final RenderObject? overlay =
              Overlay.of(publicContext)?.context.findRenderObject();
          final result = await showMenu(
              context: publicContext,
              // Show the context menu at the tap location
              position: RelativeRect.fromRect(
                  Rect.fromLTWH(tapPosition.dx, tapPosition.dy, 30, 30),
                  Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                      overlay.paintBounds.size.height)),

              // set a list of choices for the context menu
              items: popupMenuActions);
        },
        child: child);
  });
}