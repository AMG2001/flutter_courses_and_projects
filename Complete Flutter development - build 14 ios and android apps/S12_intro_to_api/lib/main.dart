import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const HomePage({super.key});

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
            : ReorderableListView.builder(
                // key: Key('reorderable-list'),
                onReorder: (oldIndex, newIndex) {
                  final item = comments[oldIndex];
                  comments.removeAt(oldIndex);
                  comments.insert(newIndex, item);
                },
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: Key(comments[index]['name']),
                    leading: Icon(Icons.comment_bank_outlined),
                    title: Text(comments[index]['name']),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comments[index]['email']),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          comments[index]['body'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ));
  }
}
