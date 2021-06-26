import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:post_storage/AddPage/AddPage.dart';
import 'package:post_storage/AppBloc/AppBloc.dart';
import 'package:post_storage/AppBloc/AppEvent.dart';
import 'package:post_storage/AppBloc/AppState.dart';
import 'package:post_storage/MainPage/MainPage.dart';
import 'package:post_storage/NotificationsManager.dart';
import 'package:post_storage/main.dart';


class AppBase extends StatefulWidget {
  const AppBase();

  @override
  _AppBaseState createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  @override
  void initState() {
    super.initState();

    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;



  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppBloc>(
        create: (_) => AppBloc()..add(Check()),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is Admin)
              return AddPage();
            if (state is Emp || state is Guest)
              return MainPage();
            else
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          },
        ),
      ),
      builder: EasyLoading.init(),
    );
  }
}
