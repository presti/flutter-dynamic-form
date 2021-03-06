import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/ui/bloc/form_bloc.dart';
import 'package:flutterapp/ui/state/form_state.dart';
import 'package:flutterapp/ui/widgets/form_builder.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter Demo",
      home: BlocProvider<FormBloc>(
        create: (context) => FormBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: BlocBuilder<FormBloc, FormBlocState>(
        builder: (context, formState) {
          return FormBuilder.getStepper(context, formState);
        },
      ),
    );
  }

}
