part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {

  @override
  List<Object?> get props => [];
}
class UserFirstEvent extends UsersEvent{
}