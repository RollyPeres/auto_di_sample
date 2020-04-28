import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/auth_bloc.dart';
import 'core/locator.dart';

// this gets pulled from android using platform channels
Future<String> _getAppFlavor() => Future.value('prod');

extension on String {
  String toEnvironment() {
    if (this == 'dev') return Environment.dev;
    if (this == 'prod') return Environment.prod;
    return null;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final flavor = await _getAppFlavor();
  final environment = flavor.toEnvironment();
  await bootstrapLocator(environment);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<AuthBloc>()..add(AppStarted()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: BlocBuilder<AuthBloc, AuthState>(
        builder: (_, state) {
          return Text(state.userId);
        },
      )),
    );
  }
}
