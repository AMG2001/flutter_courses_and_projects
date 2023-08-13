// import 'package:flutter/material.dart';
// import 'package:learn_work_manager/notifications.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:workmanager/workmanager.dart';
// import 'package:intl/intl.dart';

// class TasksNames {
//   static const String task1 = "task1";
//   static const String task2 = "task2";
//   static const String task3 = "task3";
//   static const String task4 = "task4";
// }

// @pragma(
//     'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
// void callbackDispatcher() {
//   Workmanager().executeTask((task_name, inputData) {
//     switch (task_name) {
//       case TasksNames.task1:
//         print('Task 1 Performed');
//         return Future.value(true);
//       case TasksNames.task2:
//         print('Task 2 Performed');
//         return Future.value(true);
//       case TasksNames.task3:
//         Notifications.instance.showNotification(
//           notif_title: "AMG Bot",
//           notif_subTitle:
//               'Current date : \n${DateFormat.yMMMd().format(DateTime.now())}\ncreated by AMG Bot',
//         );
//         return Future.value(true);
//       default:
//         print('Task fail');
//         return Future.error('Task not executed');
//     }
//   });
// }

// // Get a reference your Supabase client
// final supabase = Supabase.instance.client;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url: 'https://jquklpsmsweaqfrktnah.supabase.co',
//     anonKey:
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxdWtscHNtc3dlYXFmcmt0bmFoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTE1MjA5OTcsImV4cCI6MjAwNzA5Njk5N30.OE1ON8F8brZpg1HUF7QkH0L2Az-jac1BThIh02lxPyU',
//   );

//   // Workmanager().initialize(
//   //     callbackDispatcher, // The top level function, aka callbackDispatcher
//   //     isInDebugMode:
//   //         true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
//   //     );
//   // await Workmanager().registerPeriodicTask(
//   //   TasksNames.task3,
//   //   TasksNames.task3,
//   //   frequency: Duration(minutes: 20),
//   // );
//   // await Workmanager().registerOneOffTask(TasksNames.task1, TasksNames.task1);
//   // await Workmanager().registerOneOffTask(TasksNames.task2, TasksNames.task2);

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// int post_id = 1;
// List dataFromSupabase = [];

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String db_name = 'posts_db';
//   String column_name = 'post_content';

//   void getAllDataFromDatabase() async {
//     await supabase.from(db_name).select(column_name).then((value) {
//       print('fetched data from supabase : $value');
//     });
//     await supabase.auth.signInWithPassword(
//         email: 'mohamadamgad09@gmail.com', password: 'AMG01096482183');
//   }

//   @override
//   void initState() {
//     getAllDataFromDatabase();
//     Notifications.instance.initNotifications();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 24,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               /**
//                * {
//                 'id': post_id,
//                 'post_content': ,
//               }
//                */
//               await supabase
//                   .from(db_name)
//                   .insert([
//                     {column_name: "Post content $post_id"},
//                   ])
//                   .select()
//                   .then(
//                     (value) => print('data uploaded successfully #'),
//                   );
//               post_id++;
//             },
//             child: Text("Upload Data"),
//           ),
//         ],
//       ),
//     );
//   }
// }
