import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/LoginPage/LoginPage.dart';
import 'package:post_storage/core/Application/AuthenticationBloc/AuthBloc.dart';
import 'package:post_storage/core/Application/AuthenticationBloc/AuthEvent.dart';
import 'package:post_storage/core/Application/AuthenticationBloc/AuthState.dart';

class AuthPage extends StatelessWidget {
  const AuthPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()..add(Check()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context , state) {
            if(state is Loading)
              return Center(child: CircularProgressIndicator());
            if(state is Logout)
              return LoginPage();
            else
              return Container();
          },
        ),
      ),
    );
  }
}
