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
      routes: {
        '/a': (context) => HomePage(),
        '/b': (context) => SecondPage(),
      },
      initialRoute: '/a',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: Text("mohamadamgad09@gmail.com"),
              accountName: Text("Mohamad Amgad"),
              currentAccountPicture: CircleAvatar(
                child: Text("AMG"),
              ),
            ),
            ListTile(
                title: Text("HomePage"),
                trailing: Icon(Icons.home),
                onTap: () => Navigator.of(context).pushNamed('/a')),
            ListTile(
              title: Text("Second Page"),
              trailing: Icon(Icons.security_update_rounded),
              onTap: () => Navigator.of(context).pushNamed('/b'),
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text("Second Screen"),
        ),
      ),
    );
  }
}

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
      // Create animation Object
  late AnimationController animationController;
  @override
  void initState() {
    /**
     * Initialize animation Controller with :
     * Duration .
     * vsync : with take ticker , and we here made our class as Ticker , so we give it this .
     */
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
