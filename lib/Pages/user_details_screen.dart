import 'package:block_example/Pages/covid_screen.dart';
import 'package:block_example/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UsersBloc, UsersState>(
        listener: (context, state) {
          if (state is UserDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (contextx, state) {
          print(state);
          if (state is UsersInitial) {
            return _buildLoading();
          } else if (state is UserDataLoading) {
            return _buildLoading();
          } else if (state is UserDataLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${state.userDetailsModel.users!.first.firstName!}${state.userDetailsModel.users!.first.lastName!}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(contextx, MaterialPageRoute(
                        builder: (context) => CovidSCreen(),));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => CovidSCreen(),
                      // ));
                    },
                    child: Text("NEXT"))
              ],
            );
          } else if (state is UserDataError) {
            return Container(
              child: Center(child: Text("Error")),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
