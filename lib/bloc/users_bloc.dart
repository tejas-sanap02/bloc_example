import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_example/Api/example_repository.dart';
import 'package:block_example/model/example_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final ApiRepository apiRepository = ApiRepository();
  UsersBloc() : super(UsersInitial()) {
    on<UsersEvent>((event, emit) async {
   try{
     emit(UserDataLoading());
     final userList= await apiRepository.fetchUserList();
     emit(UserDataLoaded(userList));
     if(userList.users == null ){
       emit(UserDataError("user Data not available"));
     }
   }on NetworkError{
     emit(UserDataError("Fetch to load data"));
   }
    });
  }
}
