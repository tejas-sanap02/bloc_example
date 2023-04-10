import 'package:block_example/bloc/example_bloc.dart';
import 'package:block_example/bloc/users_bloc.dart';
import 'package:block_example/model/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
class CovidSCreen extends StatefulWidget {
  CovidSCreen({Key? key}) : super(key: key);

  @override
  State<CovidSCreen> createState() => _CovidSCreenState();
}


class _CovidSCreenState extends State<CovidSCreen> {
  final ExampleBloc _covidBloc = ExampleBloc();
  @override
  void initState() {

    //_covidBloc.add(CovidEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
      //   BlocProvider(
      // // providers: [
      // //   BlocProvider<ExampleBloc>(create: (context) => ExampleBloc()),
      // //   BlocProvider<UsersBloc>(create: (context) => UsersBloc()),
      // // ],
      // create: (context) => _covidBloc,
      // child:
      BlocListener<ExampleBloc, ExampleState>(
        listener: (context, state) {
          if (state is CovidError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<ExampleBloc, ExampleState>(
          builder: (context, state) {
            print(state);

            if (state is CovidInitial) {
              return _buildLoading();
            } else if (state is CovidLoading) {
              return _buildLoading();
            } else if (state is CovidLoaded) {
              print("data::${state.covidModel.countries?.first.date!}");
              return _buildCard(context, state.covidModel);
              // return Text(
              //     "${state.covidModel.countries?.first.date!}"); //_buildCard(context, state.covidModel);
            } else if (state is CovidError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
  //  )
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: const Color.fromARGB(255, 196, 193, 193), width: 0.5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Country: ${model.countries![index].country}".toUpperCase(),
              ),
              const SizedBox(height: 10),
              Text(
                "Total Confirmed: ${model.countries![index].totalConfirmed}"
                    .toUpperCase(),
              ),
              const SizedBox(height: 10),
              Text(
                "Total Deaths: ${model.countries![index].totalDeaths}"
                    .toUpperCase(),
              ),
              const SizedBox(height: 10),
              Text(
                "Total Recovered: ${model.countries![index].totalRecovered}"
                    .toUpperCase(),
              ),
            ],
          ),
        );
      },
    );
  }
}
