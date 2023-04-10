import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_example/Api/example_api_provider.dart';
import 'package:block_example/Api/example_repository.dart';

import 'package:block_example/model/covid_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'example_event.dart';
part 'example_state.dart';


class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(CovidInitial()) {
    final ApiRepository apiRepository  = ApiRepository();

    on<CovidEvent>((event, emit) async {
      try {
        emit(CovidLoading());
        final mList = await apiRepository.fetchCovidList();
        print('data at bloc ::${mList.countries?.first.country}');
        try{
        emit (CovidLoaded(mList));}
        catch (e){
          print(e);
        }
        if (mList.countries == null || mList.id == null) {
          emit(CovidError(mList.message));
        }
      } on NetworkError {
        emit(const CovidError("Failed to fetch data. is your device online?"));
      }
    }
    );
  }
}
