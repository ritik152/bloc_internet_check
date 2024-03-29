import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/internet_bloc/check_internet_bloc.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: BlocConsumer<CheckInternetBloc, CheckInternetState>(
          listener: (context, state){
            if(state is CheckInternetGainedInitialState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Connected"),backgroundColor: Colors.green,));
            }
            else if(state is CheckInternetLostInitialState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Not Connected"),backgroundColor: Colors.red,));

            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Loading...."),backgroundColor: Colors.yellow,));

            }
          },
          builder: (context, state) {
            if(state is CheckInternetGainedInitialState){
              return const Text("Connected");
            }
            else if(state is CheckInternetLostInitialState){
              return const Text("Not Connected");
            }
            else{
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
