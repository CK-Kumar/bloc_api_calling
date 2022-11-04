import 'package:bloc_api_app/bloc/api_bloc.dart';
import 'package:bloc_api_app/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ApiBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc App'),
        ),
        body: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(state.users[index].firstName);
                });
          }
          if (state is UserErrorState) {
            return Text(state.error);
          }
          return Container();
        }),
      ),
    );
  }
}
