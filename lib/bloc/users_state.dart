part of 'users_bloc.dart';

@immutable
abstract class UsersState extends Equatable {
  @override
  List<Object?> get props => [];
}
class UsersInitial extends UsersState {
}
class UserDataLoading extends UsersState{
}
class UserDataLoaded extends UsersState{
final UserDetailsModel userDetailsModel ;

  UserDataLoaded(this.userDetailsModel);
@override
List<Object?> get props => [userDetailsModel];
}
class UserDataError extends UsersState{
  final String error;
  UserDataError(this.error);
  @override
  List<Object?> get props => [error];
}
